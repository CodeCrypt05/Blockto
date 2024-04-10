import 'package:blockto_app/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    showSplash();
    super.onInit();
  }

  var user;
  showSplash() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    user = FirebaseAuth.instance.authStateChanges();

    if (user != null) {
      Get.offNamed(AppRoutes.homeScreen);
    }
    Get.offNamed(AppRoutes.onBoardingScreen);
  }
}
