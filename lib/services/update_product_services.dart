import 'dart:developer';

import '../helper/api.dart';
import '../models/product_model.dart';

class UpdateProductServices {
  Future<ProductModel> updateProduct({
    required dynamic id,
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    final String url = 'https://fakestoreapi.com/products/$id';
    Map<String, dynamic> body = {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    };

    try {
      Map<String, dynamic> exactData = await Api().put(url: url, data: body);
      log('exactData => ${exactData.toString()}');
      return ProductModel.fromJson(exactData);
    } catch (e) {
      log('e:$e #');
      throw Exception('There was an error! :-  $e #');
    }
  }
}
