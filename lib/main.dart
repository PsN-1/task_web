import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mobile/models/task_manager/task_manager.dart';
import 'package:task_mobile/models/user_manager.dart';
import 'package:task_mobile/splash/splash_screen.dart';
import 'package:task_mobile/ui/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
        ),
        ChangeNotifierProvider(
          create: (_) => TaskManager(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/splash",
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case "/home":
              return MaterialPageRoute(builder: (_) => HomePage());
            case "/splah":
              return MaterialPageRoute(builder: (_) => const SplashScreen());
          }
        },
      ),
    );
  }
}
