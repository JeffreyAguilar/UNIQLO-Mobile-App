import 'package:flutter/material.dart';
import 'package:e_comm_app/models/products.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: SizedBox(width: 100, child: Image.network(product.imageUrl)),
        title: Text(product.name),
        subtitle: Text('\$${product.price.toString()}\nSKU: ${product.sku}'),
        onTap: () {},
      ),
    );
  }
}
