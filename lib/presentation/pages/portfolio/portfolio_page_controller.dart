import 'package:blockto_app/data/api_services/coin_market_service.dart';
import 'package:blockto_app/data/firebase_services/firebase_services.dart';
import 'package:blockto_app/data/local_storage/local_storage.dart';
import 'package:blockto_app/models/coin_market_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PortfolioPageController extends GetxController {
  final FirebaseAuth auth = FirebaseService().auth;
  final RxMap coinList = {}.obs;
  // RxDouble totalInitialInvestment = 0.0.obs;
  final RxMap userData = {}.obs;
  Rx<QuerySnapshot<Map<String, dynamic>>?> coinsStream =
      Rx<QuerySnapshot<Map<String, dynamic>>?>(null);
  Rx<double> totalInitialInvestment = Rx<double>(0);
  Rx<Map<String, dynamic>> initialInvestmentMap = Rx<Map<String, dynamic>>({});
  var coinMarketList = <CoinMarketModel>[].obs;
  var isLoading = false.obs;
  Map<String, dynamic> investmentMap = {};
  var newPrices = <String?, double>{};
  var portfolioProfit = 0.0.obs;
  double coinCount = 0.0;
  double coinPrice = 0.0;

  @override
  void onInit() {
    GetBuyedCoinList();
    getCoinMarket();
    super.onInit();
  }

  Future<void> GetBuyedCoinList() async {
    User? user = FirebaseAuth.instance.currentUser;
    String userId = user!.uid;
    FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('coins')
        .snapshots()
        .listen((snapshot) {
      coinsStream.value = snapshot;

      double totalInvestment = 0;

      snapshot.docs.forEach((doc) {
        String coinSymbol = doc.data()['coin_symbol'];
        double coinBought = doc.data()['coin_bought'];
        investmentMap[coinSymbol] = coinBought;
      });
      totalInitialInvestment.value = totalInvestment;
      initialInvestmentMap.update((value) {
        value!.addAll(investmentMap); // Update the map with the new data
      });

      // Print the map
      print('Initial investment map:');
      print(initialInvestmentMap.value);
    });
  }

  //--------

  getCoinMarket() async {
    try {
      isLoading(true);
      var data = await CoinMarketApi().getCoinMarketData();

      var coinMarketData =
          data.map((json) => CoinMarketModel.fromJson(json)).toList();
      coinMarketList.assignAll(coinMarketData);

      for (var coinData in coinMarketList) {
        var symbol = coinData.symbol;
        var price = coinData.currentPrice;

        if (initialInvestmentMap.value.containsKey(symbol)) {
          double totalPrice = initialInvestmentMap.value[symbol];
          double newPrice = price! * totalPrice;
          coinCount += totalPrice;
          coinPrice += newPrice;
          newPrices[symbol] = newPrice;
          print("updated map: ${newPrice}");
          coin.write('coins', newPrices);
        }
      }
      portfolioProfit.value = coinCount * coinPrice;
    } finally {
      isLoading(false);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete<PortfolioPageController>();
    super.dispose();
  }
}
