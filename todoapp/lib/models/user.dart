import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String fullName;
  String email;
  Timestamp accountCreated;
  List<String> groupIds;

  UserModel({
    this.uid,
    this.fullName,
    this.email,
    this.accountCreated,
    this.groupIds,
  });
}
