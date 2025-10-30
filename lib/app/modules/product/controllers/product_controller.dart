import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/provider/api_provider.dart';
import '../../../models/product_model.dart';

class ProductController extends GetxController {
  final _apiprovider = Get.find<APIprovider>();

  RxList<Product> lstProducts = RxList();
  @override
  void onInit() {
    getproduct();
    super.onInit();
  }

  Future<void> getproduct() async {
    try {
      final response = await _apiprovider.getproduct();
      if (response.statusCode == 200) {
        final product = response.data as List;
        lstProducts.value = product.map((e) => Product.fromJson(e)).toList();
      } else {
        print("error on get product!");
      }
    } catch (e) {
      Get.defaultDialog(title: "message", content: Text(e.toString()));
    }
  }
}
