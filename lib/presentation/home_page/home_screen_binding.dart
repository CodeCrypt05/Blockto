import 'package:blockto_app/presentation/home_page/home_screen_controller.dart';
import 'package:blockto_app/presentation/pages/home/home_page_controller.dart';
import 'package:blockto_app/presentation/pages/market/market_page_controller.dart';
import 'package:blockto_app/presentation/pages/portfolio/portfolio_page_binding.dart';
import 'package:blockto_app/presentation/pages/settings/settings_page_bindings.dart';
import 'package:get/get.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
    // Get.lazyPut(() => HomePageController());
    // Get.lazyPut(() => MarketPageController());
    // Get.lazyPut(() => PortfolioPageBinding());
    // Get.lazyPut(() => SettingPageBindings());
  }
}
