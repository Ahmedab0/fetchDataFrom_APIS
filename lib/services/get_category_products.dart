import 'dart:developer';

import '../helper/api.dart';
import '../models/product_model.dart';

class CategoryAllProducts {

  Future<List<ProductModel>> getCategoryProducts({required String categoryName}) async {
    final String url = 'https://fakestoreapi.com/products/category/$categoryName';
    final List<ProductModel> catProducts = [];

    List<dynamic> data = await Api().get(url: url);
    for (var obj in data) {
      catProducts.add(ProductModel.fromJson(obj));
    }
    log(catProducts[0].title);
    return catProducts;
  }
}

/*    try {
      final response = await dio.get(url);
        final data = response.data;
        for (var obj in data) {
          catProducts.add(ProductModel.fromJson(obj));
        }
        log(catProducts[0].title);
        return catProducts;
    } on DioException catch (e) {
      final String messageError = e.response.toString();
      throw Exception(messageError);
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }*/