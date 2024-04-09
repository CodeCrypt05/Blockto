import 'package:blockto_app/presentation/onboarding/onboarding_screen_controller.dart';
import 'package:get/get.dart';

class OnBoardingScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingScreenController());
  }
}
