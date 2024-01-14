import 'dart:developer';

import 'package:store_app_apis/helper/api.dart';
import 'package:store_app_apis/models/product_model.dart';

class AllProductsServices {

  Future<List<ProductModel>> getProducts() async {
    const String url = 'https://fakestoreapi.com/products';
    final List<ProductModel> products = [];

    List <dynamic> data = await Api().get(url: url);
    for (var item in data) {
      products.add(ProductModel.fromJson(item));
    }
    log(products[0].price.toString());
    return products;
  }
}



