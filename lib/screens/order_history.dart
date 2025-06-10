import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: Center(
        child: Text(
          'Order History will be displayed here.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
