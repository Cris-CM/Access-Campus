import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/core/widgets/loading_indicator.dart';
import 'package:qr_tracker/core/widgets/texts.dart';
import 'package:sizer/sizer.dart';

const apiKey = 'AIzaSyCuirXuBpbamAZyi8Bt_cSBQT0s2XQDfTo';

class ChatbotView extends StatefulWidget {
  const ChatbotView({Key? key}) : super(key: key);

  @override
  _ChatbotViewState createState() => _ChatbotViewState();
}

class _ChatbotViewState extends State<ChatbotView> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> messages = [];
  final model = GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey: apiKey,
  );
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.kPrimary,
        iconTheme: IconThemeData(
          color: Palette.white,
          size: 3.h,
        ),
        title: const Texts.bold(
          "ChatBot",
          fontSize: 12,
          color: Palette.white,
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: messages.length + (isLoading ? 1 : 0),
              itemBuilder: (_, index) {
                if (isLoading && index == 0) {
                  return const LoadingIndicator();
                }
                return messages[isLoading ? index - 1 : index];
              },
              reverse: true,
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: const IconThemeData(color: Palette.black),
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Enviar mensaje',
                ),
                onSubmitted: _handleSubmitted,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(
                  Icons.send,
                ),
                onPressed: () {
                  _handleSubmitted(_controller.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _controller.clear();
    ChatMessage message = ChatMessage(text: text, sender: 'user');
    setState(() {
      messages.insert(0, message);
      isLoading = true;
    });

    _resolveDoubt(text);
  }

  void _resolveDoubt(String question) async {
    const extra = 'Responde de manera breve: ';

    final content = [Content.text(extra + question)];
    final response = await model.generateContent(content);

    String reply = response.text ?? '';
    ChatMessage botReply = ChatMessage(text: reply, sender: 'bot');
    setState(() {
      messages.insert(0, botReply);
      isLoading = false;
    });
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final String sender;

  const ChatMessage({Key? key, required this.text, required this.sender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isUser = sender == 'user';
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser)
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: const CircleAvatar(child: Text('Bot')),
            ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: isUser ? Palette.grey400 : Palette.grey200,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Texts.regular(
                text,
                fontSize: 8.sp,
                style: TextStyle(
                  color: isUser ? Palette.white : Palette.blue,
                ),
              ),
            ),
          ),
          if (isUser)
            Container(
              margin: const EdgeInsets.only(left: 8.0),
              child: const CircleAvatar(
                radius: 27,
                backgroundImage: AssetImage('assets/pikachu.png'),
              ),
            ),
        ],
      ),
    );
  }
}
