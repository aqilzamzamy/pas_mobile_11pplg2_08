import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_08/assets/colors.dart';
import 'package:pas_mobile_11pplg2_08/components/custom_button.dart';
import 'package:pas_mobile_11pplg2_08/components/custom_text.dart';
import 'package:pas_mobile_11pplg2_08/components/custom_text_field.dart';
import 'package:pas_mobile_11pplg2_08/controllers/login_controller.dart';

import 'package:pas_mobile_11pplg2_08/routes/routes.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login Page"),
        backgroundColor: AppColors.primaryDark,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),

            child: Card(
              elevation: 8,
              shadowColor: AppColors.primaryLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),

              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      myText: "Welcome!",
                      myTextColor: AppColors.primary,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),

                    CustomText(
                      myText: "Masukkan Username dan Password untuk Login",
                      myTextColor: Colors.grey.shade500,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                    ),

                    Padding(padding: EdgeInsets.only(top: 15)),

                    // USN
                    CustomTextField(
                      controller: loginController.usernameController,
                      label: "Username",
                      suffix: const Icon(Icons.person),
                    ),

                    Padding(padding: EdgeInsets.only(top: 15)),

                    //  PW
                    Obx(() {
                      return CustomTextField(
                        controller: loginController.passwordController,
                        label: "Password",
                        obscure: !loginController.isPasswordVisible.value,
                        suffix: IconButton(
                          icon: Icon(
                            loginController.isPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: loginController.togglePasswordVisibility,
                        ),
                      );
                    }),

                    Padding(padding: EdgeInsets.only(top: 15)),

                    Obx(() {
                      return loginController.isLoading.value
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () => loginController.login(context),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                    }),

                    Padding(padding: EdgeInsets.only(top: 15)),

                    CustomButton(
                      text: "Register",
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      myTextColor: Colors.white,
                      backgroundColor: AppColors.primary,
                      onPressed: () {
                        Get.offAllNamed(AppRoutes.registerPage);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
