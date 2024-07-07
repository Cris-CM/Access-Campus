import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_tracker/core/router/router.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://hjpehulvvcgggidoarsu.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhqcGVodWx2dmNnZ2dpZG9hcnN1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjAyODUyNTMsImV4cCI6MjAzNTg2MTI1M30.xqEb5LtDz4mm_sUeTtYJVXfIF5tLCz2v3bKT67keAQQ',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          navigatorKey: navigatorKey,
          title: 'Access Campus',
          initialRoute: "/splash",
          getPages: getRouter,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
