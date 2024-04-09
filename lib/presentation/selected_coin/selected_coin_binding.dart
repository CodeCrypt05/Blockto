import 'package:blockto_app/presentation/selected_coin/selected_coin_controller.dart';
import 'package:get/get.dart';

class SelectedCoinPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectedCoinPageController());
  }
}
