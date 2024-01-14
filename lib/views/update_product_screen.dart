import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app_apis/models/product_model.dart';
import 'package:store_app_apis/services/update_product_services.dart';
import '../widget/custom_button.dart';

import '../widget/custom_text_field.dart';

class UpdateProductScreen extends StatefulWidget {
  static const String routeNamed = 'UpdateProductScreen';

  const UpdateProductScreen(
      {super.key});


  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? name, desc, image;
  dynamic price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: const Text('Update Product'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  hintText: 'product name',
                  onChange: (value) {
                    name = value;
                    setState(() {

                    });
                  },
                  inputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'description',
                  onChange: (value) {
                    desc = value;
                    setState(() {

                    });
                  },
                  inputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'price',
                  onChange: (value) {
                    setState(() {
                      price = value;
                    });
                  },
                  inputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'image',
                  onChange: (value) {
                    image = value;
                    setState(() {

                    });
                  },
                  inputType: TextInputType.text,
                ),
                const SizedBox(height: 40),
                CustomButton(
                  label: 'Update',
                  color: Colors.blue,
                  onTapped: () async {
                    log('###################### AHMED ##################');
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      await updateProduct(product);
                      log('success');
                    } catch (e){
                      log(e.toString());
                    }
                    setState(() {
                      isLoading = false;
                    });
                   // Navigator.of(context).pushNamed(HomePage.routeNamed);
                  },
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductServices().updateProduct(
        id: product.id,
        title: name ?? product.title,
        price: price ?? product.price.toString(),
        description: desc ?? product.description,
        image: image ?? product.image,
        category: product.category,
    );
  }
}
