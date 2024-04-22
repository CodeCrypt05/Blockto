import 'package:blockto_app/presentation/swap/swap_screen_controller.dart';
import 'package:get/get.dart';

class SwapCoinScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SwapCoinScreenController());
  }
}
