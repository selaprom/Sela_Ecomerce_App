import 'package:get/get.dart';

import '../data/provider/api_provider.dart';

class APIbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(APIprovider(), permanent: true);
  }
}
