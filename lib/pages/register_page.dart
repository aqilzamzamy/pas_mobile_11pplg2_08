import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_08/assets/colors.dart';
import 'package:pas_mobile_11pplg2_08/components/custom_button.dart';
import 'package:pas_mobile_11pplg2_08/components/custom_text.dart';
import 'package:pas_mobile_11pplg2_08/components/custom_text_field.dart';
import 'package:pas_mobile_11pplg2_08/controllers/register_controller.dart';
import 'package:pas_mobile_11pplg2_08/routes/routes.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find<RegisterController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Register", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primaryDark,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Card(
              elevation: 10,
              shadowColor: AppColors.primaryLight.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 40,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Buat Akun Baru",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDark,
                      ),
                    ),
                    const SizedBox(height: 10),

                    const CustomText(
                      fontWeight: FontWeight.w200,
                      textAlign: TextAlign.center,
                      myText: "Isi semua detail untuk membuat akun baru.",
                      fontSize: 14,
                      myTextColor: Colors.grey,
                    ),

                    const SizedBox(height: 30),

                    // FULL NAME
                    CustomTextField(
                      controller: controller.fullNameController,
                      label: "Nama Lengkap",
                      suffix: const Icon(Icons.person_outline),
                    ),
                    const SizedBox(height: 18),

                    // USERNAME
                    CustomTextField(
                      controller: controller.usernameController,
                      label: "Username",
                      suffix: const Icon(Icons.account_circle_outlined),
                    ),
                    const SizedBox(height: 18),

                    // EMAIL
                    CustomTextField(
                      controller: controller.emailController,
                      label: "Email",
                      suffix: const Icon(Icons.email_outlined),
                    ),
                    const SizedBox(height: 18),

                    // PASSWORD
                    Obx(() {
                      return CustomTextField(
                        controller: controller.passwordController,
                        label: "Password",
                        obscure: !controller.isPasswordVisible.value,
                        suffix: IconButton(
                          icon: Icon(
                            controller.isPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                      );
                    }),

                    const SizedBox(height: 30),

                    // BUTTON REGISTER
                    Obx(() {
                      return CustomButton(
                        text: "Register",
                        isLoading: controller.isLoading.value,
                        onPressed: () => controller.register(),
                      );
                    }),

                    const SizedBox(height: 16),

                    // NAVIGASI KE LOGIN
                    TextButton(
                      onPressed: () {
                        Get.offAllNamed(AppRoutes.loginPage);
                      },
                      child: Text(
                        "Sudah punya akun? Login",
                        style: TextStyle(
                          color: AppColors.primaryDark,
                          fontSize: 14,
                        ),
                      ),
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
