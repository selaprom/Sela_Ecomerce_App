import 'package:ecomerce_24/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  var ischangetheme = true.obs;
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

  void changeTheme() {
    ischangetheme.value = !ischangetheme.value;
    Get.changeThemeMode(ischangetheme.value ? ThemeMode.light : ThemeMode.dark);
  }
}
