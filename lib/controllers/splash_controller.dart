import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_08/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    checklogin();
  }

  checklogin() async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 1));

    if (prefs.getString("username") != null) {
      Get.offAllNamed(AppRoutes.menuPage);
    } else {
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }
}
