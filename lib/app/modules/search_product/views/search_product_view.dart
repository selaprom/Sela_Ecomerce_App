import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/search_product_controller.dart';

class SearchProductView extends GetView<SearchProductController> {
  const SearchProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'SearchProductView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
