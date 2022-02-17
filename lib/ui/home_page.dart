import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mobile/components/generic_float_button.dart';
import 'package:task_mobile/models/task_manager/task_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GenericFloatButton(),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset("assets/db1_logo.png")),
              Text(
                "Task - Mobile",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text("Olá, seja bem-vindo Pedro!"),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Card(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Column(
                    children: [Text("20"), Text("Task ativas")],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Column(
                    children: [Text("20"), Text("Task ativas")],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
