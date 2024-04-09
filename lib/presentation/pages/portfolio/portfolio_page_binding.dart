import 'package:blockto_app/presentation/pages/portfolio/portfolio_page_controller.dart';
import 'package:get/get.dart';

class PortfolioPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PortfolioPageController());
  }
}
