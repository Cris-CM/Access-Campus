import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_tracker/core/router/router.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Access Campus',
          initialRoute: "/login",
          getPages: getRouter,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
