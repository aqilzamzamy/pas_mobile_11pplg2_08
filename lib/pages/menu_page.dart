import 'package:flutter/material.dart' hide MenuController;
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_08/assets/colors.dart';
import 'package:pas_mobile_11pplg2_08/controllers/menu_controller.dart';
import 'package:pas_mobile_11pplg2_08/pages/profile_page.dart';
import 'package:pas_mobile_11pplg2_08/pages/table_fav_tvshows_page.dart';
import 'package:pas_mobile_11pplg2_08/pages/table_tvshows_page.dart';

class MenuPage extends StatelessWidget {
  MenuPage({super.key});

  final menuController = Get.find<MenuController>();

  final List<Widget> pages = [
    TableTvshowsPage(),
    TableFavTvshowsPage(),
    ProfilePage(),
    // TableKutankPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[menuController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.primary,
          selectedItemColor: AppColors.accent,
          unselectedItemColor: AppColors.primaryLight,
          currentIndex: menuController.selectedIndex.value,
          onTap: menuController.changePage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: "Home",
              //
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: "Bookmarks",
              //
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              //
            ),
          ],
        ),
      ),
    );
  }
}
