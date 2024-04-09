import 'package:blockto_app/data/firebase_services/firebase_services.dart';
import 'package:blockto_app/routes/app_routes.dart';
import 'package:blockto_app/utils/components/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreenController extends GetxController {
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final hidePassword = true.obs;

  final FirebaseAuth _auth = FirebaseService().auth;

  Future<void> onSigninClicked() async {
    Loader.showLoader();
    if (signInFormKey.currentState!.validate()) {
      try {
        final userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString(),
        );
        Get.back();

        Get.offAllNamed(AppRoutes.homeScreen);
      } on FirebaseAuthException catch (error) {
        print("email is wrong");
        Get.back();
        if (error.code == 'email-already-in-use') {}
        Get.snackbar(
          error.message.toString() ?? "Registration failed",
          "Please try again",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.red,
          backgroundColor: Colors.white,
        );
      }
    }
  }

  @override
  void onClose() {
    emailController.clear();
    passwordController.clear();
    super.onClose();
  }
}
