import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_08/api/base_url.dart';
import 'package:pas_mobile_11pplg2_08/model/login.dart';
import 'package:pas_mobile_11pplg2_08/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var isPasswordVisible = false.obs;
  var isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login(BuildContext context) async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Username atau Password tidak boleh kosong",
        backgroundColor: Colors.orange,
      );
      return;
    }

    isLoading.value = true;

    try {
      final url = Uri.parse("${BaseUrl.baseUrl}/login");
      final response = await http.post(
        url,
        body: {"username": username, "password": password},
      );

      print(response.body); // DEBUG

      final data = jsonDecode(response.body);
      final loginModel = LoginModel.fromJson(data);

      if (response.statusCode == 200) {
        if (loginModel.status == true) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString("token", loginModel.token);

          Get.snackbar("Berhasil", "Login sukses!");

          Get.offAllNamed(AppRoutes.menuPage);
        } else {
          Get.snackbar(
            "Login Gagal",
            loginModel.message,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          "Error Server",
          "Status: ${response.statusCode}",
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Username atau Password salah",
        backgroundColor: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.clear();
      usernameController.clear();
      passwordController.clear();

      Get.offAllNamed(AppRoutes.loginPage);
      Get.snackbar("Logout", "Berhasil keluar dari akun");
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }
}
