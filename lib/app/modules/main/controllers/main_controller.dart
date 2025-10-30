import 'package:ecomerce_24/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  var current_index = 0;
  final box = GetStorage();
  void logout() {
    box.remove('token');
    Get.offAllNamed(Routes.LOGIN);
  }

  void ontep(int index) {
    current_index = index;
    update();
  }

  final pages = [
    Routes.PRODUCT,
    Routes.SEARCH_PRODUCT,
    Routes.NOTIFICATION,
    Routes.SETTING,
  ];
  void onchange(int index) {
    current_index = index;
    update();
    Get.offAllNamed(pages[index], id: 1);
  }
}
