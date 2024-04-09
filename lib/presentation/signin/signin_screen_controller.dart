import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreenController extends GetxController {
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final hidePassword = true.obs;

  @override
  void dispose() {
    signInFormKey.currentState!.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
