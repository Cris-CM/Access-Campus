import 'package:flutter/material.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:sizer/sizer.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  _LoadingIndicatorState createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8.0),
            child: const CircleAvatar(child: Text('Bot')),
          ),
          Flexible(
            child: Row(
              children: List.generate(3, (index) {
                return FadeTransition(
                  opacity: _animation,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    height: 1.h,
                    width: 2.w,
                    decoration: BoxDecoration(
                      color: Palette.blue,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
