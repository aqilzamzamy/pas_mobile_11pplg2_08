// lib/pages/table_fav_tvshows_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_08/assets/colors.dart';
import 'package:pas_mobile_11pplg2_08/controllers/table_fav_tvshows_controller.dart';

class TableFavTvshowsPage extends StatelessWidget {
  TableFavTvshowsPage({super.key});

  final favCtrl = Get.put(TableFavTvshowsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite TV Shows"),
        centerTitle: true,
        backgroundColor: AppColors.primaryDark,
      ),
      body: Obx(() {
        if (favCtrl.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (favCtrl.favorites.isEmpty) {
          return const Center(child: Text("Belum ada favorit."));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: favCtrl.favorites.length,
          itemBuilder: (context, index) {
            final row = favCtrl.favorites[index];
            final id = row['id'] as int;
            final name = row['name'] as String? ?? '';
            final image = row['image'] as String? ?? '';
            final rating = (row['rating'] as num?)?.toDouble() ?? 0.0;

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(image),
                ),
                title: Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Rating: $rating"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.grey),
                  onPressed: () {
                    favCtrl.toggleFavorite(
                      id: id,
                      name: name,
                      image: image,
                      rating: rating,
                    );
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
