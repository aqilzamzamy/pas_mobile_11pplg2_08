import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_08/components/custom_button.dart';
import 'package:pas_mobile_11pplg2_08/components/custom_text_field.dart';
import 'package:pas_mobile_11pplg2_08/controllers/register_controller.dart';
import 'package:pas_mobile_11pplg2_08/routes/routes.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController registerController =
        Get.find<RegisterController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Register", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple, // warna janlup di AppColors nnti
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Card(
              elevation: 8,
              shadowColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Buat Akun Baru",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Isi semua detail untuk mendaftar.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 25),

                    // NAMA LENGKAP
                    CustomTextField(
                      controller: registerController.fullNameController,
                      label: 'Nama Lengkap',
                      suffix: const Icon(Icons.person_2_outlined),
                    ),

                    const SizedBox(height: 15),

                    // USN
                    CustomTextField(
                      controller: registerController.usernameController,
                      label: "Username",
                      suffix: const Icon(Icons.person),
                    ),
                    const SizedBox(height: 15),

                    // EMAIL
                    CustomTextField(
                      controller: registerController.emailController,
                      label: 'Email',
                      suffix: const Icon(Icons.email),
                    ),
                    const SizedBox(height: 15),

                    // PW
                    // Obx(() {
                    //   return CustomTextField(
                    //     controller: registerController.passwordController,
                    //     label: "Password",
                    //     obscure: !registerController.isPasswordVisible.value,
                    //     suffix: IconButton(
                    //       icon: Icon(
                    //         registerController.isPasswordVisible.value
                    //             ? Icons.visibility
                    //             : Icons.visibility_off,
                    //       ),
                    //       onPressed: registerController.togglePasswordVisibility,
                    //     ),
                    //   );
                    // }),
                    const SizedBox(height: 30),

                    // BTN REGISTER
                    Obx(() {
                      return SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: CustomButton(
                          text: registerController.isLoading.value
                              ? 'Mendaftar...'
                              : 'Register',
                          onPressed: registerController.isLoading.value
                              ? () {}
                              : registerController.register,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          myTextColor: Colors.white,
                          backgroundColor: Colors.deepPurple,
                        ),
                      );
                    }),
                    const SizedBox(height: 12),

                    // tombol login
                    TextButton(
                      onPressed: () {
                        Get.offAllNamed(AppRoutes.loginPage);
                      },
                      child: Text(
                        'Sudah punya akun? Login',
                        style: TextStyle(color: Colors.purple[800]),
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
