import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:provider/provider.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    signOut();
  }

  void signOut() {}
}
