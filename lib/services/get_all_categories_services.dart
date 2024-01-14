
import 'dart:developer';

import '../helper/api.dart';

class AllCategoriesServices {

  Future<List<dynamic>> getCategories () async {
    const String url = 'https://fakestoreapi.com/products/categories';

    List<dynamic> categories = await Api().get(url: url);
    log(categories[0]);
    return categories;
  }
}