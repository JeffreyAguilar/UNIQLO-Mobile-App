import 'package:e_comm_app/screens/shirts_catalogue.dart';
import 'package:flutter/material.dart';

class ProductListingPage extends StatelessWidget {
  const ProductListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://image.uniqlo.com/UQ%2FCMS%2Fnavi%2Fimage%2FNAVI_469864_32.jpg')),
            title: const Text('Outerwear'),
            onTap: () {},
          ),
          ListTile(
            leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://image.uniqlo.com/UQ%2FCMS%2Fnavi%2Fimage%2FNAVI_470143_56.jpg')),
            title: const Text('T-Shirts, Sweats & Fleece'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShirtsCatalogue()));
            },
          ),
          ListTile(
            leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://image.uniqlo.com/UQ%2FCMS%2Fnavi%2Fimage%2FNAVI_469479_73.jpg')),
            title: const Text('Sweaters & Cardigans'),
            onTap: () {},
          ),
          ListTile(
            leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://image.uniqlo.com/UQ%2FCMS%2Fnavi%2Fimage%2FNAVI_469420_35.jpg')),
            title: const Text('Shirts & Polos'),
            onTap: () {},
          ),
          ListTile(
            leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://image.uniqlo.com/UQ%2FCMS%2Fnavi%2Fimage%2FNAVI_469341_36.jpg')),
            title: const Text('Dresses & Skirts'),
            onTap: () {},
          ),
          ListTile(
            leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://image.uniqlo.com/UQ%2FCMS%2Fnavi%2Fimage%2FNAVI_469855_05.jpg')),
            title: const Text('Bottoms'),
            onTap: () {},
          ),
          ListTile(
            leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://image.uniqlo.com/UQ%2FCMS%2Fnavi%2Fimage%2FNAVI_464333_35.jpg')),
            title: const Text('Innerwear & Underwear'),
            onTap: () {},
          ),
          ListTile(
            leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://image.uniqlo.com/UQ%2FCMS%2Fnavi%2Fimage%2FNAVI_472074_58.jpg')),
            title: const Text('Loungewear & Home'),
            onTap: () {},
          ),
          ListTile(
            leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://image.uniqlo.com/UQ%2FCMS%2Fnavi%2Fimage%2FNAVI_470040_31.jpg')),
            title: const Text('Accessories'),
            onTap: () {},
          ),
          ListTile(
            leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://image.uniqlo.com/UQ%2FCMS%2Fnavi%2Fimage%2FNAVI_464732_12.jpg')),
            title: const Text('Linen'),
            onTap: () {},
          ),
          ListTile(
            leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://image.uniqlo.com/UQ/ST3/us/imagesother/Navigation/navigation_Heattech.png')),
            title: const Text('HEATTECH'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
