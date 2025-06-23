import 'dart:math';

class Product {
  final String name;
  final double price;
  final String description;
  final String imageUrl;
  final String sku;

  Product(
      {required this.name,
      required this.price,
      required this.description,
      required this.imageUrl,})
      : sku = generateSKU(name, price);

  static String generateSKU(String name, double price) {
    final random = Random();
    final randomNumber = random.nextInt(10000);
    final namePart = name.substring(0, min(3, name.length)).toUpperCase();
    final pricePart = price.toStringAsFixed(0);
    return '$namePart-$pricePart-$randomNumber';
  }

  factory Product.fromFirestore(Map<String, dynamic> data){
    return Product(name: data['name'] ?? '', price: (data['price'] ?? 0.0).toDouble(), imageUrl: data['imageUrl'] ?? '', description: data['description'] ?? '');
  }
}
