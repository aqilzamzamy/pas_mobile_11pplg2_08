import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_08/assets/colors.dart';
import 'package:pas_mobile_11pplg2_08/components/custom_button.dart';
import 'package:pas_mobile_11pplg2_08/components/custom_text.dart';
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
        backgroundColor: AppColors.primaryDark,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                "assets/profile.jpg",
              ), // jgn lupa asetny
            ),

            Padding(padding: EdgeInsets.only(top: 15)),

            CustomText(
              myTextColor: AppColors.text,
              myText: "Aqil Zamzami Musthofa",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),

            CustomText(
              myTextColor: AppColors.text,
              myText: "08",
              fontSize: 15,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
            ),

            CustomText(
              myTextColor: AppColors.text,
              myText: "11 PPLG 2",
              fontSize: 15,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
            ),

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
