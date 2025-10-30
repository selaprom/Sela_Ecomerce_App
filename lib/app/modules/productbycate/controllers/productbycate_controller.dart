import 'package:ecomerce_24/app/data/provider/api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/product_by_cate.dart';

class ProductbycateController extends GetxController {
  final _apiprovider = Get.find<APIprovider>();
  final id = Get.arguments['cateId'];

  @override
  void onInit() {
    getproductcat();
    super.onInit();
  }

  RxList<ProductCate> lstproduct = RxList();
  Future<void> getproductcat() async {
    final response = await _apiprovider.getProductByCate(id);
    if (response.statusCode == 200) {
      final product = response.data as List;
      lstproduct.value = product.map((e) => ProductCate.fromJson(e)).toList();
    } else {
      Get.defaultDialog(title: "message", content: Text("Error on getproduct"));
    }
  }
}
