import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/productbycate_controller.dart';

class ProductbycateView extends GetView<ProductbycateController> {
  const ProductbycateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProductbycateView'), centerTitle: true),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(15),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemCount: controller.lstproduct.length,
            itemBuilder: (context, index) {
              final productcate = controller.lstproduct[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Expanded(child: Image.network(productcate.image!)),
                  ),
                  Text(
                    productcate.name ?? "",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "\$${productcate.price}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
