import 'package:blockto_app/data/network/network_service.dart';
import 'package:blockto_app/presentation/home/home_screen_controller.dart';
import 'package:blockto_app/presentation/onboarding/onboarding_screen_controller.dart';
import 'package:blockto_app/presentation/pages/home/home_page_controller.dart';
import 'package:blockto_app/presentation/pages/market/market_page_controller.dart';
import 'package:blockto_app/presentation/pages/portfolio/portfolio_page_controller.dart';
import 'package:blockto_app/presentation/pages/settings/settings_page_controller.dart';
import 'package:blockto_app/presentation/splash/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => HomeScreenController());
    //-- pages
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => MarketPageController());
    Get.lazyPut(() => PortfolioPageController());
    Get.lazyPut(() => SettingPageController());

    //- Onboarding
    Get.lazyPut(() => OnBoardingScreenController());

    Get.lazyPut(() => NetworkService());
  }
}
