import 'package:flutter/material.dart';
import 'package:e_comm_app/widgets/cart_button.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/UNIQLO_logo_%28Japanese%29.svg/2058px-UNIQLO_logo_%28Japanese%29.svg.png'),
      ),
      actions: <Widget>[
        CartButton(onPressed: () {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              Navigator.pushNamed(context, '/cart');
            },
          );
        }),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
