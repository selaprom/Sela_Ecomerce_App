import 'package:ecomerce_24/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainMiddleware extends GetMiddleware {
  final box = GetStorage();
  @override
  RouteSettings? redirect(String? route) {
    final token = box.read('token');
    if (token != null) {
      return null;
    }
    return RouteSettings(name: Routes.LOGIN);
  }
}
