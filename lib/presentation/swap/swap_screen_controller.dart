import 'package:blockto_app/data/api_services/coin_market_service.dart';
import 'package:blockto_app/data/local_storage/local_storage.dart';
import 'package:blockto_app/models/coin_market_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwapCoinScreenController extends GetxController {
  GlobalKey<FormState> swapCoinFormKey = GlobalKey<FormState>();
  final swapCoinController = TextEditingController();
  var coinMarketList = <CoinMarketModel>[].obs;
  var isLoading = false.obs;
  RxInt inputValue = 0.obs;
  RxInt result = 0.obs;

  @override
  void onInit() async {
    await getCoinMarket();
    swapCoinClicked();
    super.onInit();
  }

  // void calculateResult() {
  //   debounce(const Duration(milliseconds: 300)).listen((value) {
  //     calculateResult(value);
  //   });
  //   // Convert the input value to an integer and multiply by 2
  //   result.value = inputValue.value * 2 ?? 0;
  // }

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

  void swapCoinClicked() {
    Map<String?, double> storedCoin = coin.read('coins');
    print('stored data: $storedCoin');
  }
}
