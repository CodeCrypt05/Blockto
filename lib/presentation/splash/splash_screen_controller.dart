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

    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        Get.offNamed(AppRoutes.homeScreen);
      } else {
        Get.offNamed(AppRoutes.onBoardingScreen);
      }
    });
  }
}



//   final FirebaseAuth _auth = FirebaseService().auth;

//   @override
//   void onReady() {
//     super.onReady();

//     _user = Rx<User?>(_auth.currentUser);
//     // our user would be notified
//     _user.bindStream(_auth.userChanges());
//     ever(_user, _initialScreen);
//   }

//   _initialScreen(User? user) {
//     if (user == null) {
//       Get.offAll(() => const SignInScreen());
//     } else {
//       Get.offAll(() => HomeScreen());
//     }
//   }
// }