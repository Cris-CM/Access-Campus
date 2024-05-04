import 'package:get/get.dart';
import 'package:qr_tracker/Features/Auth/Controllers/auth_binding.dart';
import 'package:qr_tracker/Features/Auth/Views/login_view.dart';
import 'package:qr_tracker/Features/Home/Controllers/home_binding.dart';
import 'package:qr_tracker/Features/Home/Views/home_view.dart';

final getRouter = <GetPage>[
  GetPage(
    name: "/login",
    page: () => const LoginView(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: "/home",
    page: () => const HomeView(),
    binding: HomeBinding(),
  ),
];
