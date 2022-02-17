import 'package:flutter/material.dart';
import 'package:task_mobile/login/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nextPage(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  Container(
            width: 100, height: 100, child: Image.asset('assets/db1_logo.png')),
      ),
    );
  }
}

nextPage(BuildContext context) async {
 await Future.delayed(Duration(seconds: 3)).then((value) => {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()))
 });
}

