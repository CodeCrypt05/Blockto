import 'package:blockto_app/presentation/signup/signup_screen_controller.dart';
import 'package:get/get.dart';

class SignUpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpScreenController());
  }
}
