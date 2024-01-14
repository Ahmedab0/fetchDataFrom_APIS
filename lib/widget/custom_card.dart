import 'package:flutter/material.dart';
import 'package:store_app_apis/models/product_model.dart';

import '../views/update_product_screen.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // card
        Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.grey.shade300,
                  offset: const Offset(7, 7),
                ),
              ]),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(UpdateProductScreen.routeNamed,arguments: product);
            },
            child: Card(
              //color: Colors.white,
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // title
                     Text(
                      product.title.substring(0,7),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${product.price.toString()}', style: const TextStyle(fontSize: 18)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 26,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 25,
          top: -45,
          child: Image.network(product.image,
            fit: BoxFit.cover,
            height: 80,
            width: 80,
          ),
        ),
      ],
    );
  }
}
