import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_tracker/Features/Auth/Controllers/auth_controller.dart';
import 'package:qr_tracker/core/colors/palette.dart';
import 'package:qr_tracker/core/widgets/circular_loading.dart';
import 'package:qr_tracker/core/widgets/custom_button.dart';
import 'package:qr_tracker/core/widgets/custom_input.dart';
import 'package:qr_tracker/core/widgets/texts.dart';
import 'package:sizer/sizer.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.loading()) {
          return const CircularLoadingWidget();
        }
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/fondo.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(4.w),
                padding: EdgeInsets.all(7.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: Palette.white,
                ),
                child: Form(
                  key: controller.loginKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Texts.regular(
                          'Bienvenido a',
                          color: Palette.kPrimary,
                          fontSize: 12,
                        ),
                        subtitle: Texts.bold(
                          'Access Campus',
                          color: Palette.kPrimary,
                          fontSize: 20,
                        ),
                      ).paddingOnly(bottom: 2.h),
                      CustomInput(
                        controller: controller.usernameController,
                        title: "Usuario",
                        icon: Icons.person_2_outlined,
                        validator: (p0) {
                          if (p0 == null) return "Rellene el campo";
                          if (p0.isEmpty) return "Rellene el campo";
                          return null;
                        },
                      ).paddingOnly(bottom: 2.h),
                      CustomInput(
                        controller: controller.passwordController,
                        title: "Contraseña",
                        icon: Icons.lock,
                        isPassword: true,
                        inputType: TextInputType.number,
                        validator: (p0) {
                          if (p0 == null) return "Rellene el campo";
                          if (p0.isEmpty) return "Rellene el campo";
                          return null;
                        },
                      ).paddingOnly(bottom: 2.h),
                      Align(
                        alignment: Alignment.center,
                        child: CustomButton(
                          onPressed: controller.login,
                          text: "Iniciar Sesion",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
