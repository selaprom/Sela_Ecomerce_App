import 'package:ecomerce_24/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
  @override
  void onInit() {
    onInitTheme();

    advancedSwitchController.addListener(() {
      isOn.value = advancedSwitchController.value;
    });
    super.onInit();
  }

  final advancedSwitchController = ValueNotifier<bool>(false);
  var isOn = true.obs;
  void togle(bool isChange) {
    var locale = Locale('en', "us");
    isChange ? locale = Locale('kh', "km") : Locale('en', "us");
    Get.updateLocale(locale);
  }

  void changSwitch(bool change) {
    // isOn.value = change;
    advancedSwitchController.value = change;
  }

  var ischangetheme = true.obs;
  Future<void> saveTheme(bool isChange) async {
    final store = await SharedPreferences.getInstance();
    await store.setBool("ThemeMode", isChange);
  }

  Future<bool> loadTheme() async {
    final store = await SharedPreferences.getInstance();
    return await store.getBool("ThemeMode") ?? true;
  }

  Future<void> onInitTheme() async {
    ischangetheme.value = await loadTheme();
    Get.changeThemeMode(ischangetheme.value ? ThemeMode.light : ThemeMode.dark);
  }

  Future<void> changeTheme() async {
    final store = await SharedPreferences.getInstance();
    ischangetheme.value = !ischangetheme.value;
    saveTheme(ischangetheme.value);

    Get.changeThemeMode(ischangetheme.value ? ThemeMode.light : ThemeMode.dark);
  }

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
