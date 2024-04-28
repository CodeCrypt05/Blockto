import 'package:blockto_app/presentation/sell_coin/sell_coin_controller.dart';
import 'package:get/get.dart';

class SellCoinBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SellCoinController());
  }
}
