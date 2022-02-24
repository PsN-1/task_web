import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mobile/login/view/login_screen.dart';
import 'package:task_mobile/models/user_manager.dart';
import 'package:task_mobile/ui/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nextPage(context, auth);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: 100, height: 100, child: Image.asset('assets/db1_logo.png')),
      ),
    );
  }
}

Future<void> nextPage(BuildContext context, FirebaseAuth auth) async {
  User currentUser = await auth.currentUser!;

  await Future.delayed(Duration(seconds: 3)).then((value) => {
        if (currentUser.uid != null)
          {
            context.read<UserManager>().context = context,
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()))
          }
        else
          {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()))
          }
      });
}
