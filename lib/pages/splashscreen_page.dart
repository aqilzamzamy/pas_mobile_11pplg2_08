import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_08/components/custom_text.dart';
import 'package:pas_mobile_11pplg2_08/controllers/splash_controller.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});

  final SplashscreenController splashController = Get.put(
    SplashscreenController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: 24)),
            CustomText(
              textAlign: TextAlign.center,
              myText: "Welcome to the Jungle",
              myTextColor: Colors.purple,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            Padding(padding: EdgeInsets.only(top: 8)),
            CustomText(
              myText: "Mobile Development",
              myTextColor: Colors.purple,
              fontSize: 14,
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.center,
            ),
            //space
            Padding(padding: EdgeInsets.only(top: 32)),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.purple),
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
