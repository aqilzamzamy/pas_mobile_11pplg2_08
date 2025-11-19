import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_08/api/base_url.dart';
import 'package:pas_mobile_11pplg2_08/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  final usernameController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var username = ''.obs;
  var isLoggedIn = false.obs;
  var isLoading = false.obs;

  var isPasswordVisible = false.obs;

  Future<Map<String, dynamic>> register() async {
    final usernameText = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final fullName = fullNameController.text.trim();

    // 🌟 Validasi input
    if (usernameText.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        fullName.isEmpty) {
      Get.snackbar(
        'Validasi Gagal',
        'Semua field harus diisi, tidak boleh ada yang kosong.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return {'success': false, 'message': 'Field tidak boleh kosong'};
    }

    isLoading.value = true;

    final url = Uri.parse('${BaseUrl.baseUrl}/register-user');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'username': usernameText,
          'password': password,
          'full_name': fullName,
          'email': email,
        },
      );

      isLoading.value = false;

      debugPrint('STATUS: ${response.statusCode}');
      debugPrint('BODY: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'] == true) {
          // Simpan username ke local storage
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', data['token']);

          username.value = usernameText;
          isLoggedIn.value = true;

          Get.snackbar(
            "Registrasi Berhasil",
            data['message'] ?? "Akun berhasil dibuat!",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );

          // Arahkan ke halaman login
          Get.offAllNamed(AppRoutes.loginPage);

          return {
            'success': true,
            'message': data['message'] ?? 'Registrasi berhasil',
          };
        }

        return {
          'success': false,
          'message': data['message'] ?? 'Registrasi gagal',
        };
      }

      return {'success': false, 'message': 'Gagal (${response.statusCode})'};
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Error",
        "Terjadi kesalahan: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      return {'success': false, 'message': 'Terjadi kesalahan: $e'};
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  void onClose() {
    usernameController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
