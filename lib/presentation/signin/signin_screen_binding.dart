import 'package:blockto_app/presentation/signin/signin_screen_controller.dart';
import 'package:get/get.dart';

class SignInScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInScreenController());
  }
}
