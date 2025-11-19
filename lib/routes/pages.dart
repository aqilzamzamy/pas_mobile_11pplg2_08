import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_08/bindings/login_binding.dart';
import 'package:pas_mobile_11pplg2_08/bindings/menu_binding.dart';
import 'package:pas_mobile_11pplg2_08/bindings/register_binding.dart';
import 'package:pas_mobile_11pplg2_08/bindings/splash_binding.dart';
import 'package:pas_mobile_11pplg2_08/bindings/table_fav_tvshows_binding.dart';
import 'package:pas_mobile_11pplg2_08/bindings/table_tvshows_binding.dart';
import 'package:pas_mobile_11pplg2_08/pages/login_page.dart';
import 'package:pas_mobile_11pplg2_08/pages/menu_page.dart';
import 'package:pas_mobile_11pplg2_08/pages/profile_page.dart';
import 'package:pas_mobile_11pplg2_08/pages/register_page.dart';
import 'package:pas_mobile_11pplg2_08/pages/splashscreen_page.dart';
import 'package:pas_mobile_11pplg2_08/pages/table_fav_tvshows_page.dart';
import 'package:pas_mobile_11pplg2_08/pages/table_tvshows_page.dart';
import 'package:pas_mobile_11pplg2_08/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.menuPage,
      page: () => MenuPage(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: AppRoutes.profilePage,
      page: () => ProfilePage(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.splashscreenPage,
      page: () => SplashscreenPage(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: AppRoutes.loginPage,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.registerPage,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.tableTvshowsPage,
      page: () => TableTvshowsPage(),
      binding: TableTvshowsBinding(),
    ),
    GetPage(
      name: AppRoutes.tableFavTvshowsPage,
      page: () => TableFavTvshowsPage(),
      binding: TableFavTvshowsBinding(),
    ),
  ];
}
