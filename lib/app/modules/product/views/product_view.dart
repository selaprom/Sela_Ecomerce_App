import 'package:ecomerce_24/app/modules/product_detail/views/product_detail_view.dart';
import 'package:ecomerce_24/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Products")),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(15),
          child: RefreshIndicator(
            onRefresh: () async {
              controller.getproduct();
            },
            child: ListView.builder(
              itemCount: controller.lstProducts.length,
              itemBuilder: (context, index) {
                final category = controller.lstProducts[index];
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          category.categoryName ?? "",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(
                              Routes.PRODUCTBYCATE,
                              arguments: {"cateId": category.categoryId},
                            );
                          },
                          child: Text("See All"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 300,

                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount:
                            category.products == null
                                ? 0
                                : category.products!.length,
                        itemBuilder: (contest, index) {
                          final product = category.products![index];
                          return Container(
                            margin: EdgeInsets.only(left: 10),
                            height: 120,
                            width: 250,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => ProductDetailView(product: product),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 5,
                                children: [
                                  Container(
                                    child: Image.network(
                                      product.image ?? "",
                                      // fit: BoxFit.cover,
                                    ),
                                    height: 150,
                                    width: 200,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.deepPurple,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "\$${product.price}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Text("${product.description}"),
                                  ElevatedButton(
                                    onPressed: () {
                                      //cartController.addToCart(product);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),

                                    child: Text('Add to Cart'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
