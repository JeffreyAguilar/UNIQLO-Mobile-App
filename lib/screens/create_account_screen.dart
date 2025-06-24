import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_comm_app/services/authentication_service.dart';
import 'package:e_comm_app/models/user.dart' as AppUser;

class CreateAccountScreen extends StatefulWidget {
   const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {

  final AuthService firebaseAuth = AuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String errorMessage = '';

  @override
  void dispose() {
   _emailController.dispose();
   _confirmEmailController.dispose();
   _passwordController.dispose();
   super.dispose();
  }

  Future<void> createAccount() async {
    setState(() {
      errorMessage = '';
    });
    String email = _emailController.text.trim();
    String confirmEmail = _confirmEmailController.text.trim();
    String password = _passwordController.text.trim();

    if(email.isEmpty || confirmEmail.isEmpty || password.isEmpty){
      setState(() => errorMessage = 'One or more fields are empty. Please try again.');
      return;
    }
    if(!confirmEmails(email, confirmEmail)){
      setState(() {
        errorMessage = 'Emails do not match. Please try again.';
      }); 
      return;
    }

    try {
      // Create account using Firebase Authentication
      UserCredential? result = await firebaseAuth.createAccount(email: email, confirmEmail: confirmEmail, password: password);

      // Ensure result contains the Firebase User object
      if (result?.user == null) {
        setState(() => errorMessage = 'Could not sign up with those credentials. Please try again.');
      } else {
        String? userId = result?.user?.uid; // Use Firebase User's uid if not null

        // Create a User object using the user model
        AppUser.User newUser = AppUser.User(
          userId: userId ?? '',
          name: '', // Placeholder for name, can be updated later
          email: email,
          phone: 0, // Placeholder for phone, can be updated later
          address: {}, // Placeholder for address, can be updated later
          orderHistory: [],
          wishList: [],
        );

        // Save the User object to Firestore
        await FirebaseFirestore.instance.collection('users').doc(userId).set({
          'name': newUser.name,
          'email': newUser.email,
          'phone': newUser.phone,
          'address': newUser.address,
          'orderHistory': newUser.orderHistory,
          'wishList': newUser.wishList,
        });

      if (mounted) {
        Navigator.pushNamed(context, '/home');
      } else {
        print('Widget is no longer mounted');
      }
    }
  } catch (e) {
    setState(() => errorMessage = 'Error creating account: $e');
  }
    
  }

  bool confirmEmails(String email, String confirmEmail){
    if(email != confirmEmail){
      return false;
    }
    else {
      return true;
    }
  }

  void areFieldsEmpty(String email, String confirmEmail, String password){
    if(email.isEmpty || confirmEmail.isEmpty || password.isEmpty){
      setState(() => errorMessage = 'One or more fields are empty. Please try again');
    }
  }

  Widget _errorDisplay(){
    return Text(errorMessage, style: TextStyle(color: Colors.redAccent),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(height: 120,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5vb7wReWlhdy-j3ZGyu4_fnjMBUKhphfsHw&s'),
              const SizedBox(
                height: 110,
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(
                height: 20,
              ),
               TextField(
                controller: _confirmEmailController,
                decoration: InputDecoration(labelText: 'Re-enter Email'),
              ),
              const SizedBox(
                height: 20,
              ),
               TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    createAccount();
                  },
                   child: const Text('Create Account')),
                   _errorDisplay(),
                  SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
