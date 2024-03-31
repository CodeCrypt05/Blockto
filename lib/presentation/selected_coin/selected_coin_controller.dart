import 'package:blockto_app/data/services/coin_chart_service.dart';
import 'package:blockto_app/models/coin_chart_model.dart';
import 'package:get/get.dart';

class SelectedCoinPageController extends GetxController {
  var coinChartList = <CoinChartModel>[].obs;
  var isLoading = false.obs;
  dynamic data = '';

  @override
  void onInit() async {
    data = await Get.arguments;
    await getCoinChart(data.id);
    super.onInit();
  }

  getCoinChart(String coinName) async {
    try {
      isLoading(true);
      var data = await CoinChartApi().getCoinChartData(coinName);
      print(data);
      var coinCharttData =
          data.map((json) => CoinChartModel.fromJson(json)).toList();
      coinChartList.assignAll(coinCharttData);
    } finally {
      isLoading(false);
    }
  }
}
