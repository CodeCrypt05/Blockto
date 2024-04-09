import 'package:blockto_app/data/api_services/coin_chart_service.dart';
import 'package:blockto_app/models/coin_chart_model.dart';
import 'package:get/get.dart';

class SelectedCoinPageController extends GetxController {
  var coinChartList = <CoinChartModel>[].obs;
  var isLoading = false.obs;
  dynamic data = '';
  RxInt selectedIndex = 0.obs;
  // List intervalList = ['D', 'W', 'M', '3m', '6m', 'Y'];

  Map<String, String> intervalMap = {
    'D': '1',
    'W': '7',
    'M': '30',
    '3M': '90',
    '6M': '180',
    'y': '365',
  };

  @override
  void onInit() async {
    data = await Get.arguments;
    await getCoinChart(
        data.id, intervalMap.values.elementAt(selectedIndex.value));
    super.onInit();
  }

  getCoinChart(String coinName, String day) async {
    try {
      isLoading(true);
      var data = await CoinChartApi().getCoinChartData(coinName, day);
      print(data);
      var coinCharttData =
          data.map((json) => CoinChartModel.fromJson(json)).toList();
      coinChartList.assignAll(coinCharttData);
    } finally {
      isLoading(false);
    }
  }
}
