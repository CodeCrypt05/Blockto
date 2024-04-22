import 'package:blockto_app/presentation/setting_tiles/paper_crypto/paper_crypto_controller.dart';
import 'package:get/get.dart';

class PaperCryptoScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaperCryptoScreenController());
  }
}
