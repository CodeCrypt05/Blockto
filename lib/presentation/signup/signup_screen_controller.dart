import 'package:blockto_app/data/firebase_services/firebase_services.dart';
import 'package:blockto_app/routes/app_routes.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreenController extends GetxController {
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final hidePassword = true.obs;

  final FirebaseAuth _auth = FirebaseService().auth;

  Future<void> onCreateAccount() async {
    if (signUpFormKey.currentState!.validate()) {
      try {
        final userCredential = await _auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        // Create firestore collection to store data

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(
          {
            "unique_id": userCredential.user!.uid.toString(),
            "name": nameController.text.toString(),
            "email": emailController.text.toString(),
            "password": passwordController.text.toString(),
          },
        );

        // Showing Snackbar of Successfully account is created
        // SnackbarCompnent.showSnackbar(
        //   "Congratulation",
        //   "Account created successfully",
        //   Colors.green,
        // );
        print('User registered successfully');

        Get.offAllNamed(AppRoutes.homeScreen);
      } on FirebaseAuthException catch (error) {
        print("email is wrong");
        Get.back();
        if (error.code == 'email-already-in-use') {}
        // SnackbarCompnent.showSnackbar(
        //     error.message.toString() ?? "Registration failed",
        //     "Please try again",
        //     Colors.red);
      }
    }
  }

  @override
  void onClose() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    super.onClose();
  }
}
