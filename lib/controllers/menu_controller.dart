import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_08/routes/routes.dart';

class MenuController extends GetxController {
  var selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  Future<void> logout() async {
    Get.offAllNamed(AppRoutes.loginPage);
  }
}
