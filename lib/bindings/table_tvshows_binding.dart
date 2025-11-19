import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_08/controllers/table_tvshows_controller.dart';

class TableTvshowsBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<TableTvshowsController>(() => TableTvshowsController());
    Get.put(TableTvshowsController());
  }
}
