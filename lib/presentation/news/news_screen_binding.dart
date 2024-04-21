import 'package:blockto_app/presentation/news/news_screen_controller.dart';
import 'package:get/get.dart';

class NewsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsScreenController());
  }
}
