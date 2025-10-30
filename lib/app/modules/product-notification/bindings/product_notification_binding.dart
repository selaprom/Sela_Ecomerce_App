import 'package:get/get.dart';

import '../controllers/product_notification_controller.dart';

class ProductNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductNotificationController>(
      () => ProductNotificationController(),
    );
  }
}
