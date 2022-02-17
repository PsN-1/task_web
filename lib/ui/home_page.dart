import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mobile/models/task_manager/task_manager.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              value = value + 1;
            });
            print("$value");
          },
          child: Text("$value"),
        ),
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Center(
          child: Card(
            elevation: 10,
            child: SizedBox(
              height: 200,
              width: 200,
              child: Row(
                children: [Text("Texto 1"), Text("Texto 1"), Text("Texto 1")],
              ),
            ),
          ),
        ));
  }
}
