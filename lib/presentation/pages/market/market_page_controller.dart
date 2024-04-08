import 'package:blockto_app/models/coin_market_model.dart';
import 'package:get/get.dart';

class MarketPageController extends GetxController {
  RxInt position = 0.obs;
  var coinMarketList = <CoinMarketModel>[].obs;
  var topGainersCoinList = <CoinMarketModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
  }
}
