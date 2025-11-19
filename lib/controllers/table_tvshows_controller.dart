// lib/controllers/table_tvshows_controller.dart
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_08/model/table_tvshows.dart'; // sesuaikan path

class TableTvshowsController extends GetxController {
  var isLoading = true.obs;
  var tvShows = <TableTvshowsModel>[].obs;

  static const String apiUrl = "https://api.tvmaze.com/shows";

  @override
  void onInit() {
    super.onInit();
    fetchTvShows();
  }

  Future<void> fetchTvShows() async {
    try {
      isLoading.value = true;
      final res = await http.get(Uri.parse(apiUrl));
      if (res.statusCode == 200) {
        final List<TableTvshowsModel> data = tableTvshowsModelFromJson(
          res.body,
        );
        tvShows.assignAll(data);
      } else {
        Get.snackbar('Error', 'Gagal mengambil data (${res.statusCode})');
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengambil data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // helper untuk mengambil values yang kita butuhkan (image, name, rating)
  String getImageAt(int index) => tvShows[index].image.medium;
  String getNameAt(int index) => tvShows[index].name;
  double getRatingAt(int index) => tvShows[index].rating.average ?? 0.0;
  int getIdAt(int index) => tvShows[index].id;
}
