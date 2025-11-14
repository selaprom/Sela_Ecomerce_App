import 'package:ecomerce_24/app/modules/notification/bindings/notification_binding.dart';
import 'package:ecomerce_24/app/modules/notification/views/notification_view.dart';
import 'package:ecomerce_24/app/modules/product/bindings/product_binding.dart';
import 'package:ecomerce_24/app/modules/product/views/product_view.dart';
import 'package:ecomerce_24/app/modules/search_product/bindings/search_product_binding.dart';
import 'package:ecomerce_24/app/modules/search_product/views/search_product_view.dart';
import 'package:ecomerce_24/app/modules/setting/bindings/setting_binding.dart';
import 'package:ecomerce_24/app/modules/setting/views/setting_view.dart';
import 'package:ecomerce_24/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  Route? onGenerateRoute(RouteSettings setting) {
    if (setting.name == Routes.PRODUCT) {
      return GetPageRoute(
        settings: setting,
        page: () => ProductView(),
        binding: ProductBinding(),
      );
    }
    if (setting.name == Routes.SEARCH_PRODUCT) {
      return GetPageRoute(
        settings: setting,
        page: () => SearchProductView(),
        binding: SearchProductBinding(),
      );
    }
    if (setting.name == Routes.NOTIFICATION) {
      return GetPageRoute(
        settings: setting,
        page: () => NotificationView(),
        binding: NotificationBinding(),
      );
    }
    if (setting.name == Routes.SETTING) {
      return GetPageRoute(
        settings: setting,
        page: () => SettingView(),
        binding: SettingBinding(),
      );
    }
  }

  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: controller,
      builder: (logic) {
        return Scaffold(
          body: Navigator(
            key: Get.nestedKey(1),
            onGenerateRoute: onGenerateRoute,
            initialRoute: Routes.PRODUCT,
          ),
          bottomNavigationBar: BottomNavigationBar(
            //backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepPurple,
            currentIndex: controller.current_index,
            onTap: controller.onchange,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_on),
                label: "Notification",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Setting",
              ),
            ],
          ),
        );
      },
    );
  }
}
