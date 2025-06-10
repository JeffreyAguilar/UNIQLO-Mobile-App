import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: Center(
        child: const Text(
          'Your wishlist is empty.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
