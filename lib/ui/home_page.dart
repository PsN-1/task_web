import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mobile/components/card_task_widget.dart';
import 'package:task_mobile/components/generic_float_button.dart';
import 'package:task_mobile/models/task_manager/task_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskManager>(builder: (_, taskManager, __) {
      double heightDevice = MediaQuery.of(context).size.height;
      return Scaffold(
        floatingActionButton: GenericFloatButton(onPressed: () {
          Navigator.pushNamed(context, "/new-task");
        }),
        body: SafeArea(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset("assets/db1_logo.png")),
                  const Text(
                    "Task - Mobile",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("Olá, seja bem-vindo Pedro!"),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${taskManager.taskCountActive}"),
                            const Text("Task ativas")
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${taskManager.tasksCountDone}"),
                            const Text("Task finalizadas")
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: heightDevice * 0.5,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: taskManager.taskData.length,
                    itemBuilder: (_, index) {
                      return CardTaskWidget(
                        taskData: taskManager.taskData[index],
                      );
                    }),
              )
            ],
          ),
        ),
      );
    });
  }
}
