import 'package:blockto_app/presentation/setting_tiles/about_us/about_us_controller.dart';
import 'package:get/get.dart';

class AboutUsScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AboutUsScreenController());
  }
}
