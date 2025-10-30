import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_notification_controller.dart';

class ProductNotificationView extends GetView<ProductNotificationController> {
  const ProductNotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    final product = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductNotificationView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            // height: 500,
            // width: 400,
            child: Image.network((product['image']), fit: BoxFit.cover),
          ),
          Row(
            children: [
              Text(
                '${product['name'] ?? ""}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text("${product['price'] ?? ""}"),
            ],
          ),
          Text(
            '${product['description'] ?? ""}',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
