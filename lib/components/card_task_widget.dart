import 'package:flutter/material.dart';
import 'package:task_mobile/models/task_data.dart';

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
          width: 250,
          height: 200,
          child: Column(
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Codigo: ",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  Text(
                    "${taskData.cod}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
              const Spacer(),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  "Projeto: ",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  taskData.project,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                )
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  "Descrição: ",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  taskData.description,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                )
              ]),
              const Spacer(),
            ],
          )),
    );
  }
}
