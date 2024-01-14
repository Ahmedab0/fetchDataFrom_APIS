import 'dart:developer';

import 'package:store_app_apis/models/product_model.dart';

import '../helper/api.dart';

class AddProductServices {
   Future<ProductModel> addProduct ({required String title, required String price,required String description,required String image,required String category}) async {
    const String url = 'https://fakestoreapi.com/products';
    Map<String, dynamic> body = {
      'title' : title,
      'price' : price,
      'description' : description,
      'image' : image,
      'category' : category,
    };
    Map<String, dynamic> exactData = await Api().post(url: url,data: body);
    log(exactData['title']);
    return ProductModel.fromJson(exactData);
  }

}