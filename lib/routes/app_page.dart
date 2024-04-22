import 'package:blockto_app/presentation/empty_notification/empty_notification_binding.dart';
import 'package:blockto_app/presentation/empty_notification/empty_notification_screen.dart';
import 'package:blockto_app/presentation/home/home_screen.dart';
import 'package:blockto_app/presentation/home/home_screen_binding.dart';
import 'package:blockto_app/presentation/news/news_screen.dart';
import 'package:blockto_app/presentation/news/news_screen_binding.dart';
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
import 'package:blockto_app/presentation/setting_tiles/paper_crypto/paper_crypto_binding.dart';
import 'package:blockto_app/presentation/setting_tiles/paper_crypto/paper_crypto_screen.dart';
import 'package:blockto_app/presentation/selected_coin/selected_coin_binding.dart';
import 'package:blockto_app/presentation/selected_coin/selected_coin_page.dart';
import 'package:blockto_app/presentation/signin/signin_screen.dart';
import 'package:blockto_app/presentation/signin/signin_screen_binding.dart';
import 'package:blockto_app/presentation/signup/signup_screen.dart';
import 'package:blockto_app/presentation/signup/signup_screen_binding.dart';
import 'package:blockto_app/presentation/splash/splash_screen.dart';
import 'package:blockto_app/presentation/splash/splash_screen_binding.dart';
import 'package:blockto_app/presentation/swap/swap_screen.dart';
import 'package:blockto_app/presentation/swap/swap_screen_binding.dart';
import 'package:blockto_app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> getPages = [
    // -- Bottom Tab pages
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
      page: () => SettingPage(),
      binding: SettingPageBindings(),
    ),

    //------Screens --------------------------------------------------------
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
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.paperCryptoScreen,
      page: () => PaperCryptoScreen(),
      binding: PaperCryptoScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.swapCoinScreen,
      page: () => SwapCoinScreen(),
      binding: SwapCoinScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.newsScreen,
      page: () => NewsScreen(),
      binding: NewsScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.emptyNotificationScreen,
      page: () => EmptyNotificationScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
      binding: EmptyNotificationScreenBinding(),
    ),

    //----- Auth Screen
    GetPage(
      name: AppRoutes.signupScreen,
      page: () => const SignUpScreen(),
      binding: SignUpScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.signinScreen,
      page: () => const SignInScreen(),
      binding: SignInScreenBinding(),
    ),
  ];
}
