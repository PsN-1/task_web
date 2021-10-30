import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: 100, height: 100, child: Image.asset('db1_logo.png')),
      ),
    );
  }
}

// void openNextPage() {
//   await Future.delayed(
//     Duration(seconds: 2),
//   )
// }