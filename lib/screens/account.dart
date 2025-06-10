import 'package:e_comm_app/screens/login.dart';
import 'package:e_comm_app/screens/order_history.dart';
import 'package:e_comm_app/screens/profile_screen.dart';
import 'package:e_comm_app/screens/wishlist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  void checkLogin(Widget targetScreen) {

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => targetScreen));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              checkLogin(const ProfileScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Order History'),
            onTap: () {
              checkLogin(const OrderHistoryScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text('Wishlist'),
            onTap: () {
              checkLogin(const WishlistScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.store),
            title: const Text('Store locator'),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text('Customer Support'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
