import 'package:flutter/material.dart';
import 'package:task_mobile/models/task_data.dart';

class CardTaskWidget extends StatelessWidget {
  final TaskData taskData;

  CardTaskWidget({Key? key, required this.taskData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: SizedBox(
          width: 300,
          height: 200,
          child: Column(
            children: [
              Spacer(),
              Text("Codigo: ${taskData.cod}"),
              Spacer(),
              Text("Projeto: ${taskData.project}"),
              Text("Descrição: ${taskData.description}"),
              Spacer(),
            ],
          )),
    );
  }
}
