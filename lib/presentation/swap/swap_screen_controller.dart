import 'package:blockto_app/data/api_services/coin_market_service.dart';
import 'package:blockto_app/data/firebase_services/firebase_services.dart';
import 'package:blockto_app/data/local_storage/local_storage.dart';
import 'package:blockto_app/models/coin_market_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwapCoinScreenController extends GetxController {
  GlobalKey<FormState> swapCoinFormKey = GlobalKey<FormState>();
  final swapCoinControllerText = TextEditingController();
  var coinMarketList = <CoinMarketModel>[].obs;
  var isLoading = false.obs;

  final FirebaseAuth auth = FirebaseService().auth;

  //-- Coin Data
  RxDouble coinPrice = 0.0.obs;
  RxString imageUrl = ''.obs;
  RxString coinName = ''.obs;
  RxString coinSymbol = ''.obs;
  RxDouble initialInvestment = 0.0.obs;
  // double coinsBought,
  RxDouble currentCoinValue = 0.0.obs;

  @override
  void onInit() async {
    await getCoinMarket();
    swapCoinClicked();
    super.onInit();
  }

  getCoinMarket() async {
    try {
      isLoading(true);
      var data = await CoinMarketApi().getCoinMarketData();

      var coinMarketData =
          data.map((json) => CoinMarketModel.fromJson(json)).toList();
      coinMarketList.assignAll(coinMarketData);
    } finally {
      isLoading(false);
    }
  }

  void swapCoinClicked() async {
    Map<String?, dynamic> storedCoin = coin.read('coins');
    print('stored data: $storedCoin');
    String? key = 'usdt';
    double? storedPrice = storedCoin[key];
    double inputValue = double.parse(swapCoinControllerText.text.toString());

    double result = inputValue * coinPrice.value;

    print("here is the result: $result");

    if (result < storedPrice!) {
      storedPrice -= result;

      try {
        //-- Update the 1st coin
        await FirebaseFirestore.instance
            .collection('users')
            .doc(auth.currentUser!.uid)
            .collection('coins')
            .doc('usdt')
            .update(
          {
            "coin_bought": storedPrice,
          },
        );

        //-- Post the 2nd swap coin
        await FirebaseFirestore.instance
            .collection('users')
            .doc(auth.currentUser!.uid)
            .collection('coins')
            .doc(coinSymbol.value)
            .set({
          'img_link': imageUrl.value.toString(),
          'coin_name': coinName.value.toString(),
          'coin_symbol': coinSymbol.value.toString(),
          'initial_investment':
              double.parse(swapCoinControllerText.text.toString()),
          'coin_bought': double.parse(swapCoinControllerText.text.toString()),
          'current_coin_value': currentCoinValue.value.toDouble(),
        });

        Get.snackbar(
          "Congratulation",
          "Coin Buyed successfully",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.green,
          backgroundColor: Colors.black,
        );
        swapCoinControllerText.clear();
        Get.back();
      } on FirebaseAuthException catch (error) {
        Get.snackbar(error.message ?? "process failed", "Please try again",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.red,
            backgroundColor: Colors.black);
      }
    }
    print('here is your value: ${storedPrice}');
  }
}
