import 'package:blockto_app/presentation/pages/home/home_page_controller.dart';
import 'package:blockto_app/presentation/pages/market/market_page_controller.dart';
import 'package:blockto_app/presentation/pages/portfolio/portfolio_page_controller.dart';
import 'package:blockto_app/presentation/pages/settings/settings_page_controller.dart';
import 'package:get/get.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => MarketPageController());
    Get.lazyPut(() => PortfolioPageController());
    Get.lazyPut(() => SettingPageController());
  }
}
