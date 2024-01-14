import 'package:flutter/material.dart';
import 'package:store_app_apis/widget/custom_card.dart';

import '../models/product_model.dart';
import '../services/get_all_products_services.dart';

class HomePage extends StatelessWidget {
  static const String routeNamed = 'HomePage';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('New Trend'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_shopping_cart_outlined))
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 60.0),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductsServices().getProducts(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('opps There was an error!, ${snapshot.error}'),);
            } else if (snapshot.hasData && snapshot.data != null) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 70,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) => CustomCard(product: products[index],),
              );
            } else {
              return Center(child: Text('opps There was an error!, ${snapshot.error}'),);
            }

          },
        ),
      ),
    );
  }
}
