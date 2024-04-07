import 'package:blockto_app/presentation/home_page/home_screen_controller.dart';
import 'package:get/get.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
  }
}
