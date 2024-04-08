import 'package:blockto_app/data/services/coin_market_service.dart';
import 'package:blockto_app/data/services/news_service.dart';
import 'package:blockto_app/models/coin_market_model.dart';
import 'package:blockto_app/models/news_model/result.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var coinMarketList = <CoinMarketModel>[].obs;
  var newsDataList = <Result>[].obs;
  var isLoading = false.obs;
  RxBool tabController = false.obs;

  @override
  void onInit() async {
    await getCoinMarket();
    await getNews();
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

  getNews() async {
    try {
      isLoading(true);
      var data = await NewsApi().getNewsData();

      var newsData = data.map((json) => Result.fromJson(json)).toList();
      newsDataList.assignAll(newsData);
    } finally {
      isLoading(false);
    }
  }

  List<CoinMarketModel> getTopLosers(
      List<CoinMarketModel> coinMarketList, int count) {
    // Sort the list based on price change percentage in descending order
    coinMarketList.sort((a, b) => (a.priceChangePercentage24H ?? 0)
        .compareTo(b.priceChangePercentage24H ?? 0));

    // Get the top `count` losers
    return coinMarketList.take(count).toList();
  }

  List<CoinMarketModel> getTopGainers(
      List<CoinMarketModel> coinMarketList, int count) {
    // Sort the list based on price change percentage in descending order
    coinMarketList.sort((a, b) => (b.priceChangePercentage24H ?? 0)
        .compareTo(a.priceChangePercentage24H ?? 0));

    // Get the top `count` gainers
    return coinMarketList.take(count).toList();
  }
}
