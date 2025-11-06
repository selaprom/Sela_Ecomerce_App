import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/search_product_controller.dart';

class SearchProductView extends GetView<SearchProductController> {
  SearchProductView({super.key});
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBodyScrollView);
  }

  get _buildBodyScrollView {
    return CustomScrollView(slivers: [_appbarsliver, _bodySliver]);
  }

  get _bodySliver {
    return Obx(
      () => SliverPadding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 20),
        sliver: SliverList.builder(
          itemCount: controller.lstProducts.value.length,
          itemBuilder: (context, index) {
            final product = controller.lstProducts[index];
            return Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.network(product.image ?? ""),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Name:${product.name}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Decsription:${product.description}",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 6),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(3),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "price:\$${product.price}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  get _appbarsliver {
    return SliverAppBar(
      // backgroundColor: Colors.deepPurple.withAlpha(250),
      title: Text(
        "Search Product",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      expandedHeight: 130,

      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(10),
        centerTitle: true,
        expandedTitleScale: 1,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SizedBox(
            height: 60,
            child: TextFormField(
              style: TextStyle(fontSize: 22, color: Colors.white),
              decoration: InputDecoration(
                // border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                ),
                hintText: "Search by name",
                hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                // label: Text(
                //   "Search by name",
                //   style: TextStyle(fontSize: 15, color: Colors.white),
                // ),
                suffixIcon: Icon(Icons.search, color: Colors.white),
              ),
              controller: searchController,
              onFieldSubmitted: (value) {
                controller.searchProduct(value);
              },
            ),
          ),
        ),
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }

  get _buildBody {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          SizedBox(
            height: 60,
            width: Get.width,
            child: TextFormField(
              decoration: InputDecoration(
                // border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.deepPurple, width: 1.5),
                ),
                // hintText: "Search by name",
                hintStyle: TextStyle(fontSize: 20),
                label: Text("Search by name", style: TextStyle(fontSize: 20)),
                suffixIcon: Icon(Icons.search),
              ),
              controller: searchController,
              onFieldSubmitted: (value) {
                controller.searchProduct(value);
              },
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.lstProducts.value.length,
                itemBuilder: (context, index) {
                  final product = controller.lstProducts[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: Image.network(product.image ?? ""),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Name:${product.name}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Decsription:${product.description}",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 6),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(3),
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "price:\$${product.price}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
