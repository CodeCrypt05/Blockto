import 'package:blockto_app/presentation/home_page/home_screen_controller.dart';
import 'package:blockto_app/presentation/pages/home/home_page_controller.dart';
import 'package:blockto_app/presentation/pages/market/market_page_controller.dart';
import 'package:blockto_app/presentation/pages/portfolio/portfolio_page_controller.dart';
import 'package:blockto_app/presentation/pages/settings/settings_page_controller.dart';
import 'package:blockto_app/presentation/signin/signin_screen_controller.dart';
import 'package:get/get.dart';

class SignInScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInScreenController());
    Get.lazyPut(() => HomeScreenController());

    //-- pages
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => MarketPageController());
    Get.lazyPut(() => PortfolioPageController());
    Get.lazyPut(() => SettingPageController());
  }
}
