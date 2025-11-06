import 'package:ecomerce_24/app/data/provider/api_provider.dart';
import 'package:get/get.dart';

import '../../../models/search_model.dart';

class SearchProductController extends GetxController {
  final _apiProvider = Get.find<APIprovider>();
  RxList<SearchProduct> lstProducts = RxList([]);
  void searchProduct(String name) async {
    try {
      final response = await _apiProvider.searchProduct(name);
      if (response.statusCode == 200) {
        final product = response.data as List;
        lstProducts.value =
            product.map((e) => SearchProduct.fromJson(e)).toList();
      } else {
        print("error can not Search Product !!!");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
