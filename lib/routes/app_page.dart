import 'package:blockto_app/presentation/home/home_binding.dart';
import 'package:blockto_app/presentation/home/home_page.dart';
import 'package:blockto_app/presentation/selected_coin/selected_coin_binding.dart';
import 'package:blockto_app/presentation/selected_coin/selected_coin_page.dart';
import 'package:blockto_app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> getPages = [
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: AppRoutes.selectedCoinScreen,
      page: () => SelectedCoinPage(),
      binding: SelectedCoinPageBinding(),
    ),
  ];
}
