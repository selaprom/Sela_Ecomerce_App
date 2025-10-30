import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/product_model.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  Products product;
  ProductDetailView({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            product.name != null
                ? Text("${product.name}")
                : Text("Product Detail"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Image.network(product.image ?? ""),
            Text(
              "Product Name: ${product.name}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              "Product Price: \$${product.price}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text("Product Description: ${product.description}"),
          ],
        ),
      ),
    );
  }
}
