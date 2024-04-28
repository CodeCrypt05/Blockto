import 'package:blockto_app/data/firebase_services/firebase_services.dart';
import 'package:blockto_app/data/local_storage/local_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellCoinController extends GetxController {
  GlobalKey<FormState> sellCoinForm = GlobalKey<FormState>();
  final sellCoinTextController = TextEditingController();
  final FirebaseAuth auth = FirebaseService().auth;
  final RxDouble usdtPrice = 0.0.obs;
  // final double sellCoin = double.parse(sellCoinTextController.text);

  Future<void> sellCoins(
    double coinBought,
    String coinSymbol,
    double currentCoinValue,
  ) async {
    print(coinBought);
    print(coinSymbol);
    Map<String?, dynamic> storedMap = coin.read('coins');
    storedMap.forEach((key, value) {
      print('$key: $value');
      if (key == 'usdt') {
        usdtPrice.value = value;
      }
    });
    currentCoinValue *= double.parse(sellCoinTextController.text);
    usdtPrice.value += currentCoinValue;
    try {
      final double sellCoin = double.parse(sellCoinTextController.text);
      if (sellCoin == coinBought) {
        // delete the existing coin
        await FirebaseFirestore.instance
            .collection('users')
            .doc(auth.currentUser!.uid)
            .collection('coins')
            .doc(coinSymbol)
            .delete();
      } else {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(auth.currentUser!.uid)
            .collection('coins')
            .doc(coinSymbol)
            .update({
          'coin_bought': sellCoin,
        });

        await FirebaseFirestore.instance
            .collection('users')
            .doc(auth.currentUser!.uid)
            .collection('coins')
            .doc('usdt')
            .update({
          'coin_bought': usdtPrice.value,
        });
      }

      Get.snackbar(
        "Congratulation",
        "Coin swap successfully",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.green,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      );

      sellCoinTextController.clear();
      Get.close(1);
    } on FirebaseAuthException catch (error) {
      Get.snackbar(error.message ?? "task added failed", "Please try again",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.red,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0));
    }
  }
}
