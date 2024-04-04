import 'package:blockto_app/presentation/onboarding/model/onboarding_data_model.dart';
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
            "Track the best cryptos and coins of your choice for trading. The best crypto coins out there are here on Blockto"),
    OnBoardingDataModel(
        assets: BImages.onboarding3,
        title1: "Enjoy\nInteractive",
        title2: "Quizzes",
        subtitle: "Answer entertaining questions,\nchallenge yourself!"),
    OnBoardingDataModel(
        assets: BImages.onboarding4,
        title1: "Buy the best",
        title2: "crypto in the market",
        subtitle:
            "Track the best cryptos and coins of your choice for trading. The best crypto coins out there are here on Blockto"),
  ];

  void nextButtonClicked() {
    if (currentIndex.value != 3) {
      currentIndex.value++;
      controller.jumpToPage(currentIndex.value);
    } else {
      // Get.toNamed(AppRoutes.loginScreen);
    }
  }

  void previousButtonClicked() {
    if (currentIndex.value != 0) {
      currentIndex.value--;
      controller.jumpToPage(currentIndex.value);
    }
  }
}
