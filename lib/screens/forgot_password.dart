import 'package:e_comm_app/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final AuthService firebaseAuth = AuthService();
  final TextEditingController _emailController = TextEditingController();

  String errorMessage = '';
  String successMessage = '';

  Future<void> _resetPassword(String email) async {
    setState(() {
      errorMessage = '';
      successMessage = '';
    },);
    if(email.isEmpty){
      setState(() => errorMessage = 'Please fill in the email field.');
      return;
    }
    dynamic result = await firebaseAuth.resetPassword(email: email);
    if (result is FirebaseAuthException) {
      setState(() => errorMessage ='Could not send recovery link. Please try again.');
    }
    else {
      setState(() => successMessage = 'An email has been sent to reset your password!');
    }
  }

  Widget _errorDisplay(){
    return Text(errorMessage, style: TextStyle(color: Colors.redAccent),);
  }

  Widget _successDisplay(){
    return Text(successMessage, style: TextStyle(color: Colors.green),);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Enter Email'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _resetPassword(_emailController.text.trim());
                    },
                    child: const Text(
                      'RECOVER PASSWORD',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if(errorMessage.isNotEmpty) _errorDisplay(),
                  if(successMessage.isNotEmpty) _successDisplay(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
