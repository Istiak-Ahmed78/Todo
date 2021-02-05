import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/models/user.dart';

class DataBase {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(UserModel user) async {
    String output = "error";
    try {
      await _firestore.collection('users').doc(user.uid).set({
        'fullName': user.fullName,
        'email': user.email,
        'accountCreated': user.accountCreated,
      });
      output = 'ok';
    } catch (e) {
      output = e.message;
    }

    return output;
  }

  Future<UserModel> getUserInfo(String uid) async {
    UserModel output = UserModel();

    try {
      DocumentSnapshot _docSnapshot = await _firestore.collection("users").doc(uid).get();
      output.uid = uid;
      output.fullName = _docSnapshot.data()["fullName"];
      output.email = _docSnapshot.data()["email"];
    } catch (e) {
      print(e);
    }

    return output;
  }
}
