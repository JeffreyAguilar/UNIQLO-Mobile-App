import 'package:e_comm_app/firebase_options.dart';
import 'package:e_comm_app/screens/account.dart';
import 'package:e_comm_app/screens/edit_profile.dart';
import 'package:e_comm_app/screens/home.dart';
import 'package:e_comm_app/screens/product_listing.dart';
import 'package:e_comm_app/screens/shopping_cart.dart';
import 'package:e_comm_app/widgets/cart_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      routes: {
        '/cart': (context) => const ShoppingCart(),
        '/home': (context) => const MyHomePage(),
        '/productlist': (context) => const ProductListingPage(),
        '/account': (context) => const AccountPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Home(),
    const ProductListingPage(),
    const AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
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
            ),
            extendBodyBehindAppBar: true,
            body: _pages[_selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_rounded), label: 'Account'),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ],
      ),
    );
  }
}