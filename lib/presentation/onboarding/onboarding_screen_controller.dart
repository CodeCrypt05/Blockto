import 'package:blockto_app/presentation/onboarding/model/onboarding_data_model.dart';
import 'package:blockto_app/routes/app_routes.dart';
import 'package:blockto_app/utils/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreenController extends GetxController {
  RxInt currentIndex = 0.obs;
  final controller = PageController(keepPage: true, viewportFraction: 1.0);
  List<OnBoardingDataModel> onboardingList = [
    OnBoardingDataModel(
        assets: BImages.onboarding1,
        title1: "Welcome to",
        title2: "Crypto Universe",
        subtitle:
            "Track the best cryptos and coins of your choice for trading. The best crypto coins out there are here on Blockto"),
    OnBoardingDataModel(
        assets: BImages.onboarding2,
        title1: "Buy the best",
        title2: "crypto in the market",
        subtitle:
            "Ready to invest in top-performing cryptocurrencies? Our platform offers easy, secure purchases of the best digital assets"),
    OnBoardingDataModel(
        assets: BImages.onboarding3,
        title1: "Fortified",
        title2: "Wallet Protection",
        subtitle:
            "Safeguard your assets with our secure wallet solution. Your digital wealth is shielded by advanced encryption."),
    OnBoardingDataModel(
        assets: BImages.onboarding4,
        title1: "GuardianShield",
        title2: "Ultimate Security",
        subtitle:
            "Experience unparalleled protection with GuardianShield, our advanced encryption and multi-layered security system."),
  ];

  void nextButtonClicked() {
    if (currentIndex.value != 3) {
      currentIndex.value++;
      controller.jumpToPage(currentIndex.value);
    } else {
      Get.offNamed(AppRoutes.signinScreen);
    }
  }

  void previousButtonClicked() {
    if (currentIndex.value != 0) {
      currentIndex.value--;
      controller.jumpToPage(currentIndex.value);
    }
  }
}
