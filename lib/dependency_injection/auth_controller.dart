import 'package:blockto_app/data/firebase_services/firebase_services.dart';
import 'package:blockto_app/presentation/home_page/home_screen.dart';
import 'package:blockto_app/presentation/signin/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;
  final FirebaseAuth _auth = FirebaseService().auth;

  @override
  void onReady() {
    super.onReady();

    _user = Rx<User?>(_auth.currentUser);
    // our user would be notified
    _user.bindStream(_auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const SignInScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }
}
