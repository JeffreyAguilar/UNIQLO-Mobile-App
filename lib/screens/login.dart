import 'package:e_comm_app/screens/create_account_screen.dart';
import 'package:e_comm_app/screens/forgot_password.dart';
import 'package:e_comm_app/services/authentication_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService firebaseAuth = AuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String errorMessage = '';

  @override
  void dispose() {
   _emailController.dispose();
   _passwordController.dispose();
   super.dispose();
  }

  Future<void> signIn() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if(email.isEmpty || password.isEmpty){
      setState(() => errorMessage = 'One or more fields are empty. Please try again.');
      return;
    }

    dynamic result = await firebaseAuth.signIn(email: email, password: password);

    if(result == null){
      setState(() => errorMessage ='Could not sign in with those credentials. Please try again.');
    } else {
      if(mounted){
        Navigator.pushNamed(context, '/home');
      }
      else{
        print('Widget is no longer mounted');
      }
    }

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(height: 120,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5vb7wReWlhdy-j3ZGyu4_fnjMBUKhphfsHw&s'),
            SizedBox(height: 85),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email Address'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                signIn();
              },
              style: const ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(Size(200, 50)),
                  backgroundColor: WidgetStatePropertyAll(Colors.black)),
              child: const Text(
                'LOG IN',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateAccountScreen()));
              },
              child: const Text(
                'CREATE AN ACCOUNT',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPasswordScreen()));
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(fontSize: 12),
                ),),
                SizedBox(height: 117,)
          ],
        ),
      ),
    );
  }
}
