import 'package:blockto_app/presentation/pages/market/market_page_controller.dart';
import 'package:get/get.dart';

class MarketPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MarketPageController());
  }
}
