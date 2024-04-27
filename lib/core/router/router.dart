import 'package:go_router/go_router.dart';
import 'package:qr_tracker/Features/home_page.dart';
import 'package:qr_tracker/Features/login_page.dart';

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
