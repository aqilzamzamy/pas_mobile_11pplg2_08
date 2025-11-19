import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_08/controllers/table_fav_tvshows_controller.dart';

class TableFavTvshowsBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<TableFavTvshowsController>(() => TableFavTvshowsController());
    Get.put(TableFavTvshowsController());
  }
}
