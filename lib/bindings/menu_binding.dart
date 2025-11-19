import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_08/controllers/menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuController>(() => MenuController());
  }
}
