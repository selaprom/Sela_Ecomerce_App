import 'package:get/get.dart';

import '../controllers/productbycate_controller.dart';

class ProductbycateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductbycateController>(
      () => ProductbycateController(),
    );
  }
}
