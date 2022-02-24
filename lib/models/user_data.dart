import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  UserData({required this.email, required this.password});

  late String name, email, password, id;

  UserData.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document.get("name") as String;
    email = document.get("email") as String;
  }
}
