import 'package:flutter/material.dart';
import 'package:e_comm_app/services/authentication_service.dart';

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
    if(confirmEmails(email, confirmEmail) == false){
      setState(() {
        errorMessage = 'Emails do not match. Please try again.';
      }); 
      return;
    }
    confirmEmails(email, confirmEmail);
    dynamic result = await firebaseAuth.createAccount(email: email, confirmEmail: confirmEmail, password: password);
    if(result == null){
      setState(() => errorMessage ='Could not sign up with those credentials. Please try again.');
    } else {
      if(mounted){
        Navigator.pushNamed(context, '/home');
      }
      else{
        print('Widget is no longer mounted');
      }
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
