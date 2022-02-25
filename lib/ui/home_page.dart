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
        body: Stack(children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/fundo_colors.png"),
                      fit: BoxFit.cover)),
              child: null),
          SafeArea(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset("assets/db1_logo.png")),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Task - Mobile",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Olá, seja bem-vindo Pedro!",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${taskManager.taskCountActive}",
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const Text(
                                  "Task ativas",
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${taskManager.tasksCountDone}",
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const Text(
                                  "Task finalizadas",
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: heightDevice * 0.3,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: taskManager.taskData.length,
                        itemBuilder: (_, index) {
                          return CardTaskWidget(
                            taskData: taskManager.taskData[index],
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ]),
      );
    });
  }
}
