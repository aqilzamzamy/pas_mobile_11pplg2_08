import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_08/controllers/login_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
