import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:todoapp/models/user.dart';
import 'package:todoapp/services/db.dart';

class Auth extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<UserModel> get currenUser => FirebaseFirestore.instance
      .collection('users')
      .doc(_auth.currentUser.uid)
      .snapshots()
      .map((e) => UserModel(
            accountCreated: e.data()['accountCreated'],
            fullName: e.data()['fullName'],
            email: e.data()['email'],
          ));

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

  Future<String> signUpUser({
    String email,
    String password,
    String fullName,
  }) async {
    String output = "error";
    try {
      User user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      UserModel newUser = UserModel(
        accountCreated: Timestamp.now(),
        uid: user.uid,
        email: user.email,
        fullName: fullName,
      );
      output = await DataBase().createUser(newUser);
    } catch (e) {
      output = e.message;
    }
    return output;
  }
}
