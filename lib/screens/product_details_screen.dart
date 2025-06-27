import 'package:e_comm_app/screens/shopping_cart.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {

  final String name;
  final double price;
  final String description;
  final String imageUrl;
 
  const ProductDetailsScreen({
    super.key, 
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,});

  @override
  void _addToCart(BuildContext context) {
    // Logic to add the product to the user's cart
    // This could involve updating a Firestore collection or local state
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$name added to your cart!')),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(imageUrl, fit: BoxFit.cover),
                const SizedBox(height: 16),
                Text(
                  name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20, color: Colors.green),
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _addToCart(context);
                  },
                  child: const Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
      );
  }
}
