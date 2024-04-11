import 'package:blockto_app/data/firebase_services/firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaperCryptoScreenController extends GetxController {
  final FirebaseAuth auth = FirebaseService().auth;
  GlobalKey<FormState> paperCryptoFormKey = GlobalKey<FormState>();

  final coinPriceController = TextEditingController();

  // here handle the situation when user can perform this operation for 1 time after
  // that it will close

  Future<void> addCointoPortfolio(
    String imgUrl,
    String coinName,
    String coinSymbol,
    double initialInvestment,
    double coinsBought,
    double currentCoinValue,
  ) async {
    try {
      initialInvestment = coinsBought * currentCoinValue;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('coins')
          .doc(auth.currentUser!.uid)
          .set({
        'img_link': 'https://cryptologos.cc/logos/tether-usdt-logo.svg?v=031',
        'coin_name': coinName,
        'coin_symbol': coinSymbol,
        'initial_investment': initialInvestment,
        'coin_bought': coinsBought,
        'current_coin_value': currentCoinValue,
      });
      // ---
      Get.snackbar(
        "Congratulation",
        "Task task added successfully",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.green,
        backgroundColor: Colors.white,
      );
      coinPriceController.clear();
    } on FirebaseAuthException catch (error) {
      Get.snackbar(error.message ?? "task added failed", "Please try again",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.red,
          backgroundColor: Colors.white);
    }
  }
}
