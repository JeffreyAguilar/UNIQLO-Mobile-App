import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm_app/models/products.dart';
import 'package:e_comm_app/screens/product_details_screen.dart';
import 'package:e_comm_app/widgets/cart_button.dart';
import 'package:flutter/material.dart';

class ShirtsCatalogue extends StatelessWidget {
  const ShirtsCatalogue({super.key});

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
      body: StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('products').snapshots(), builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No products available'));
        }

        final products = snapshot.data!.docs.map((doc) => Product.fromFirestore(doc.data() as Map<String, dynamic>)).toList();

        return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                leading: Image.network(product.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                title: Text(product.name),
                subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(
                        name: product.name,
                        price: product.price,
                        description: product.description,
                        imageUrl: product.imageUrl,
                      ),
                    ),
                  );
                },
              );
            },
          );})
    );
  }
}
