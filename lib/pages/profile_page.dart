import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_08/components/custom_button.dart';
import 'package:pas_mobile_11pplg2_08/controllers/login_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile Page"),
        backgroundColor: Colors.red[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                "assets/profile.png",
              ), // jgn lupa asetny
            ),

            Padding(padding: EdgeInsets.only(top: 15)),

            Text("Aqil Zamzami Musthofa"),

            Padding(padding: EdgeInsets.only(top: 15)),

            SizedBox(
              height: 40,
              width: 100,
              child: CustomButton(
                text: "Log Out",
                onPressed: loginController.logout,
                backgroundColor: Colors.red.shade700,
                fontSize: 14.5,
                fontWeight: FontWeight.bold,
                myTextColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
