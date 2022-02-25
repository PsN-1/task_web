import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:task_mobile/models/task_data.dart';
import 'package:task_mobile/models/task_manager/task_manager.dart';

class CardTaskWidget extends StatelessWidget {
  final TaskData taskData;

  CardTaskWidget({Key? key, required this.taskData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: SizedBox(
          width: 200,
          height: 100,
          child: Column(
            children: [
              Spacer(),
              Text(
                "Codigo: ${taskData.cod}",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text("Projeto: ${taskData.project}"),
              Text("Descrição: ${taskData.description}"),
              Spacer(),
              taskData.done == false
                  ? TextButton(
                      onPressed: () {
                        context.read<TaskManager>().doneTask(taskData);
                      },
                      child: Text("Concluir"))
                  : Container()
            ],
          )),
    );
  }
}
