import 'package:blockto_app/data/firebase_services/firebase_services.dart';
import 'package:blockto_app/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SettingPageController extends GetxController {
  final FirebaseAuth _auth = FirebaseService().auth;

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.offAllNamed(AppRoutes.signinScreen);
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
