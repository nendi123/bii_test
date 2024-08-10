import 'dart:convert';

import 'package:flutter_bii/models/product.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var isLoading = true.obs;
  var products = <Product>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body) as List;

        products.value =
            result.map((product) => Product.fromJson(product)).toList();
      } else {
        print('Failed to load products');
      }
    } catch (e) {
      print('Failed to load categories');
    } finally {
      isLoading(false);
    }
  }
}
