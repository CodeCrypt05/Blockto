import 'package:get/get.dart';

class SettingPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingPageBindings());
  }
}
