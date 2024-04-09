import 'package:blockto_app/presentation/home_page/home_screen.dart';
import 'package:blockto_app/presentation/home_page/home_screen_binding.dart';
import 'package:blockto_app/presentation/onboarding/onboarding_screen.dart';
import 'package:blockto_app/presentation/onboarding/onboarding_screen_binding.dart';
import 'package:blockto_app/presentation/pages/home/home_page.dart';
import 'package:blockto_app/presentation/pages/home/home_page_binding.dart';
import 'package:blockto_app/presentation/pages/market/market_page.dart';
import 'package:blockto_app/presentation/pages/market/market_page_binding.dart';
import 'package:blockto_app/presentation/pages/portfolio/portfolio_page.dart';
import 'package:blockto_app/presentation/pages/portfolio/portfolio_page_binding.dart';
import 'package:blockto_app/presentation/pages/settings/settings_page.dart';
import 'package:blockto_app/presentation/pages/settings/settings_page_bindings.dart';
import 'package:blockto_app/presentation/selected_coin/selected_coin_binding.dart';
import 'package:blockto_app/presentation/selected_coin/selected_coin_page.dart';
import 'package:blockto_app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> getPages = [
    GetPage(
      name: AppRoutes.homePage,
      page: () => HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: AppRoutes.marketPage,
      page: () => MarketPage(),
      binding: MarketPageBinding(),
    ),
    GetPage(
      name: AppRoutes.portfolioPage,
      page: () => PortfolioPage(),
      binding: PortfolioPageBinding(),
    ),
    GetPage(
      name: AppRoutes.settingPage,
      page: () => const SettingPage(),
      binding: SettingPageBindings(),
    ),
    //----------------------------------------------------------------
    GetPage(
      name: AppRoutes.selectedCoinScreen,
      page: () => SelectedCoinPage(),
      binding: SelectedCoinPageBinding(),
    ),
    GetPage(
      name: AppRoutes.onBoardingScreen,
      page: () => const OnBoardingScreen(),
      binding: OnBoardingScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
      binding: HomeScreenBinding(),
    ),
  ];
}
