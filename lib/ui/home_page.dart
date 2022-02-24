import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mobile/components/generic_float_button.dart';
import 'package:task_mobile/models/task_manager/task_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskManager>(builder: (_, taskManager, __) {
      int tasksCount = taskManager.taskData.length;

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
                Expanded(
                  flex: 1,
                  child: Card(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("$tasksCount"), Text("Task ativas")],
                      ),
                    ),
                  ),
                ),
                SizedBox(
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
                        children: [Text("20"), Text("Task finalizadas")],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Card(
                    child: SizedBox(
                        width: 300,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spacer(),
                            Text("Codigo: 001"),
                            Spacer(),
                            Text("Projeto: IT_OMNI"),
                            Text("Descrição: Integrar Login"),
                            Spacer(),
                          ],
                        )),
                  ),
                  Card(
                    child: SizedBox(
                        width: 300,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spacer(),
                            Text("Codigo: 002"),
                            Spacer(),
                            Text("Projeto: IT_OMNI"),
                            Text("Descrição: Integrar Tela Home"),
                            Spacer(),
                          ],
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
