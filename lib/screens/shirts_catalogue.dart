import 'package:e_comm_app/models/products.dart';
import 'package:e_comm_app/widgets/cart_button.dart';
import 'package:e_comm_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ShirtsCatalogue extends StatelessWidget {
  ShirtsCatalogue({super.key});

  final List<Product> products = [
    Product(
        name: 'Green shirt',
        price: 29.99,
        description: 'Its a shirt',
        imageUrl:
            'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/466895/item/goods_55_466895_3x4.jpg?width=300'),
    Product(
        name: 'Pink shirt',
        price: 19.99,
        description: 'Its a shirt',
        imageUrl:
            'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/455365/item/goods_12_455365_3x4.jpg?width=300'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back))),
        actions: <Widget>[
          CartButton(onPressed: () {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) {
                Navigator.pushNamed(context, '/cart');
              },
            );
          }),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}
