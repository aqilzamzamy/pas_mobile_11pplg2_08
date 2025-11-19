import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_08/controllers/login_controller.dart';
import 'package:pas_mobile_11pplg2_08/controllers/menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuController>(() => MenuController());
    // Get.put(MenuController());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
