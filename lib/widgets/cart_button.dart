import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final dynamic onPressed;

  const CartButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.black,
          size: 26.0,
        ));
  }
}
