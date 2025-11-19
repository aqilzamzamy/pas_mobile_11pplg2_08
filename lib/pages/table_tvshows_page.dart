// lib/pages/table_tvshows_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_08/assets/colors.dart';
import 'package:pas_mobile_11pplg2_08/controllers/table_fav_tvshows_controller.dart';
import 'package:pas_mobile_11pplg2_08/controllers/table_tvshows_controller.dart';

class TableTvshowsPage extends StatelessWidget {
  TableTvshowsPage({super.key});

  final tableCtrl = Get.put(TableTvshowsController());
  final favCtrl = Get.put(TableFavTvshowsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TV Shows"),
        backgroundColor: AppColors.primaryDark,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        color: AppColors.background,
        child: Obx(() {
          if (tableCtrl.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (tableCtrl.tvShows.isEmpty) {
            return const Center(child: Text("Tidak ada data TV Shows."));
          }

          return RefreshIndicator(
            onRefresh: () async {
              await tableCtrl.fetchTvShows();
              await favCtrl.fetchFavorites();
              return Future.value();
            },
            child: ListView.builder(
              itemCount: tableCtrl.tvShows.length,
              itemBuilder: (context, index) {
                final image = tableCtrl.getImageAt(index);
                final name = tableCtrl.getNameAt(index);
                final rating = tableCtrl.getRatingAt(index);
                final id = tableCtrl.getIdAt(index);
                final isFav = favCtrl.isFavorite(id);

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 4,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(image),
                      onBackgroundImageError: (_, __) {},
                    ),
                    title: Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Rating: $rating"),
                    trailing: IconButton(
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        favCtrl.toggleFavorite(
                          id: id,
                          name: name,
                          image: image,
                          rating: rating,
                        );
                      },
                    ),
                    onTap: () {
                      Get.snackbar("Detail", name);
                    },
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
