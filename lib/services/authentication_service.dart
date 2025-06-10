import 'package:firebase_auth/firebase_auth.dart';



class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future signIn({required String email, required String password}) async {
    try{
      UserCredential result = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    }
    catch(error){
      return null;
    }
  }

  Future createAccount({required String email, required String confirmEmail, required String password}) async {
    if(email != confirmEmail){
      return null;
  } else{
    try{
      UserCredential result = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    }
    catch(error){
      print(error);
      return null;
    }
  }
  }

  Future signOut() async{
    try{
      return await firebaseAuth.signOut();
    }
    catch(error){
      return null;
    }
  }

  Future resetPassword({required String email}) async{
   try{
    await firebaseAuth.sendPasswordResetEmail(email: email);
    return true;
   }
   catch(error){
    return false;
   }
  }

  Future deleteAccount({required String email, required String password}) async {
    try{
      User? user = firebaseAuth.currentUser;
      if(user != null){
        await user.delete();
        return true;
      }
    }
    catch(error){
      return false;
    }
  }

}