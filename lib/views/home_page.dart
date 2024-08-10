import 'package:flutter/material.dart';
import 'package:flutter_bii/controllers/product_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  ProductController productController = Get.put(ProductController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Obx(() {
                if (productController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: productController.products.length,
                    itemBuilder: (context, index) {
                      final product = productController.products[index];
                      return ListTile(
                        title: Text(product.title),
                        leading: Image.network(
                          product.image,
                          height: 40,
                          width: 40,
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ));
  }
}
