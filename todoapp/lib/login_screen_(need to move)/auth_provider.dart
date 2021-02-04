import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signOut() async {
    String output = "error";
    try {
      await _auth.signOut();
      output = "ok";
    } catch (e) {
      output = e.message;
    }
    return output;
  }

  Future<String> loginUserWithEmail({String email, String password}) async {
    String output = "error";
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      output = "ok";
    } catch (e) {
      output = e.message;
    }
    return output;
  }
}
