import 'dart:math';

class Product {
  final String name;
  final double price;
  final String description;
  final String imageUrl;

  Product(
      {required this.name,
      required this.price,
      required this.description,
      required this.imageUrl,});

  factory Product.fromFirestore(Map<String, dynamic> data){
    return Product(name: data['name'] ?? '', price: (data['price'] ?? 0.0).toDouble(), imageUrl: data['imageUrl'] ?? '', description: data['description'] ?? '');
  }
}
