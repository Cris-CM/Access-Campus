import 'package:get/get.dart';
import 'package:qr_tracker/Features/Auth/Controllers/auth_binding.dart';
import 'package:qr_tracker/Features/Auth/Views/login_view.dart';
import 'package:qr_tracker/Features/Labs/Controllers/labs_binding.dart';
import 'package:qr_tracker/Features/Labs/Views/labs_view.dart';
import 'package:qr_tracker/Features/Sessions/controllers/sessions_binding.dart';
import 'package:qr_tracker/Features/Sessions/views/sessions_view.dart';
import 'package:qr_tracker/Features/Home/Controllers/home_binding.dart';
import 'package:qr_tracker/Features/Chatbot/chatbot_view.dart';
import 'package:qr_tracker/Features/Home/Views/home_view.dart';
import 'package:qr_tracker/Features/ScanQR/scan_qr_view.dart';
import 'package:qr_tracker/Features/Splash/splash_view.dart';

final getRouter = <GetPage>[
  GetPage(
    name: "/splash",
    page: () => const SplashView(),
  ),
  GetPage(
    name: "/login",
    page: () => LoginView(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: "/home",
    page: () => const HomeView(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: "/qrscan",
    page: () => const ScanQrView(),
  ),
  GetPage(
    name: "/chatbot",
    page: () => const ChatbotView(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: "/sessions",
    page: () => const SessionsView(),
    binding: SessionsBinding(),
  ),
  GetPage(
    name: "/labs",
    page: () => const LabsView(),
    binding: LabsBinding(),
  ),
];
