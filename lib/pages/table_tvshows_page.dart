import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_08/controllers/table_tvshows_controller.dart';
import 'package:pas_mobile_11pplg2_08/model/table_tvshows.dart';

class TableTvshowsPage extends StatelessWidget {
  TableTvshowsPage({super.key});

  final tvController = Get.find<TableTvshowsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Tv Shows Page"), //janlup ganti biar bagus
        backgroundColor: Colors.red[900],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx(() {
          if (tvController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            onRefresh: () async {
              tvController.fetchAPITableTvshows();
              return Future.value();
            },
            child: ListView.builder(
              itemCount: tvController,
              itemBuilder: (BuildContext context, int index) {  },: (context, index) {
                final team = tvController.tableStandings[index];
                return Card(
                  child: ListTile(
                    title: Text(),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(TableTvshowsModel.image),
                      radius: 25,
                    ),
                    subtitle: Text('Points: ${team.intPoints}'),
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
