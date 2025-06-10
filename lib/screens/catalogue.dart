import 'package:e_comm_app/models/products.dart';
import 'package:e_comm_app/screens/shirts_catalogue.dart';

import 'package:flutter/material.dart';
import 'package:e_comm_app/widgets/appbar.dart';

class Catalogue extends StatelessWidget {
  Catalogue({super.key});

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
      appBar: const Appbar(),
      body: ShirtsCatalogue(),
    );
  }
}
