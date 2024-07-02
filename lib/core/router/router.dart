import 'package:get/get.dart';
import 'package:qr_tracker/Features/Auth/Controllers/auth_binding.dart';
import 'package:qr_tracker/Features/Auth/Views/login_view.dart';
import 'package:qr_tracker/Features/Curse/controllers/curse_binding.dart';
import 'package:qr_tracker/Features/Curse/views/curse_view.dart';
import 'package:qr_tracker/Features/Home/Controllers/home_binding.dart';
import 'package:qr_tracker/Features/Chatbot/chatbot_view.dart';
import 'package:qr_tracker/Features/Home/Views/home_view.dart';
import 'package:qr_tracker/Features/Home/Views/qr_scan_view.dart';
import 'package:qr_tracker/Features/Labs/Controllers/labs_binding.dart';
import 'package:qr_tracker/Features/Labs/Views/labs_view.dart';
import 'package:qr_tracker/Features/SaveData/controllers/save_data_binding.dart';
import 'package:qr_tracker/Features/SaveData/views/type_plan_view.dart';
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
    page: () => const QrScanView(),
  ),
  GetPage(
    name: "/labs",
    page: () => const LabsView(),
    binding: LabsBinding(),
  ),
  GetPage(
    name: "/chatbot",
    page: () => const ChatbotView(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: "/typePlan",
    page: () => const TypePlanView(),
    binding: SaveDataBinding(),
  ),
   GetPage(
    name: "/curse",
    page: () => const CurseView(),
    binding: CurseBinding(),
  ),
];
