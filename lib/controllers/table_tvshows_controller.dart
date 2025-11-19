import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TableTvshowsController extends GetxController {
  var isLoading = false.obs;
  var tableStandings = <Table>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchAPITableTvshows() async {
    const url = "";
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(url));
      print("status code${response.statusCode}");
      print("json response${response.body}");
    } catch (e) {}
  }
}
