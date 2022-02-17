import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
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

  UserManager() {
    signOut();
  }

  Future<void> signIn({required UserData user, required Function onFail, onSucess}) async {

    _loading = true;

    try {
      UserCredential  result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      await _loadingCurrentUser(firebaseUser: result.user);
      onSucess();
    } on FirebaseAuthException catch (e, s) {
      onFail(getErrorString(e.code));
    }
    
    _loading = false;
    notifyListeners();

  }
  
  Future<void> _loadingCurrentUser({User? firebaseUser}) async {

    User currentUser = await auth.currentUser!;
    final DocumentSnapshot docUser = await firestore
        .collection("Colaboradores")
        .doc(currentUser.uid)
        .get();

    _user = UserData.fromDocument(docUser);
    notifyListeners();

    if (kDebugMode) {
      print("sem nada "+ currentUser.email!);
      print(_user.name);
    }


    notifyListeners();
  }
  void signOut() {}

  Future<void> loadTask() async {
    Stream collectionStream = FirebaseFirestore.instance.collection('users').snapshots();

    

  }

  
}
