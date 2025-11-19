// lib/controllers/favorite_controller.dart
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_08/helpers/db_helpers.dart';

class TableFavTvshowsController extends GetxController {
  final DBHelper _db = DBHelper();
  var favoriteIds = <int>{}.obs;
  var favorites = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFavorites();
  }

  Future<void> fetchFavorites() async {
    isLoading.value = true;
    try {
      final data = await _db.getFavorites();
      favorites.assignAll(data);
      // Update Set ID favorit
      favoriteIds.assignAll(data.map<int>((item) => item['id'] as int));
    } catch (e) {
      // Handle error
    } finally {
      isLoading.value = false;
    }
  }

  bool isFavorite(int id) {
    return favoriteIds.contains(id);
  }

  Future<void> toggleFavorite({
    required int id,
    required String name,
    required String image,
    required double rating,
  }) async {
    final exists = isFavorite(id);
    if (exists) {
      await _db.removeFavorite(id);
    } else {
      await _db.addFavorite(id: id, name: name, image: image, rating: rating);
    }
    await fetchFavorites();
  }
}
