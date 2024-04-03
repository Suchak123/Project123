import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpUserWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;

    } catch(e) {
      print('Sign Up Error $e');
    }
    return null;
  }

  Future<User?> loginWithEmailandPassword(String email, String password) async{
    print('Email $email');
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch(e) {
      print('Firebase Auth Exception $e');
    }
    catch (e) {
      print('Error while login');
    }
    return null;
  }
}