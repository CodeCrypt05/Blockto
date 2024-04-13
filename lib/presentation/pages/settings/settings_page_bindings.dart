import 'package:blockto_app/presentation/pages/settings/settings_page_controller.dart';
import 'package:blockto_app/presentation/setting_tiles/paper_crypto/paper_crypto_controller.dart';
import 'package:get/get.dart';

class SettingPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingPageController());
  }
}
