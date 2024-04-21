import 'package:blockto_app/presentation/empty_notification/empty_notification_controller.dart';
import 'package:get/get.dart';

class EmptyNotificationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmptyNotificationScreenController());
  }
}
