import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_08/controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
