import 'package:ecomerce_24/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  final box = GetStorage();
  void removeToken() async {
    final token = box.read("token");
    if (token == null) {
      Get.offAllNamed(Routes.LOGIN);
      return;
    } else {
      box.remove("token");
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
