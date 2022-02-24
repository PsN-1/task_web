import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_mobile/exceptions/firebase_erros.dart';
import 'package:task_mobile/models/user_data.dart';

class UserManager extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  late final UserData _user;
  UserData get user => _user;

  bool _loading = false;
  bool get loading => _loading;

  late BuildContext _routeSelectedContext;
  BuildContext get context => _routeSelectedContext;

  set context(BuildContext ctx) {
    _routeSelectedContext = ctx;
    notifyListeners();
  }

  UserManager() {
    _loadingCurrentUser();
  }

  Future<void> signIn(
      {required UserData user, required Function onFail}) async {
    _loading = true;
    notifyListeners();

    print(user.password);
    print(user.email);
    try {
      await auth.signInWithEmailAndPassword(
          email: user.email.trim(), password: user.password);

      await _loadingCurrentUser();
      Navigator.pushNamed(context, "/home");
    } on FirebaseAuthException catch (e, s) {
      print(e.code);
      onFail(getErrorString(e.code));
    }

    _loading = false;
    notifyListeners();
  }

  Future<void> _loadingCurrentUser({User? firebaseUser}) async {
    User currentUser = await auth.currentUser!;
    final DocumentSnapshot docUser =
        await firestore.collection("Employees").doc(currentUser.uid).get();

    if (docUser.exists) {
      _user = UserData.fromDocument(docUser);
    }

    notifyListeners();

    if (kDebugMode) {
      print("sem nada " + currentUser.email!);
      print(_user.name);
    }

    notifyListeners();
  }

  Future<void> signOut() async {
    await auth.signOut();
    Navigator.pushNamed(context, "/login");
  }

  Future<void> loadTask() async {
    Stream collectionStream =
        FirebaseFirestore.instance.collection('users').snapshots();
  }
}
