import 'package:go_router/go_router.dart';
import 'package:qr_tracker/Features/Home/home_page.dart';
import 'package:qr_tracker/Features/Auth/Presentation/login_page.dart';

final goRouter = GoRouter(
  initialLocation: "/login",
  routes: [
    GoRoute(
      path: "/login",
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => HomePage(),
    ),
  ],
);
