import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mobile/models/task_data.dart';
import 'package:task_mobile/models/task_manager/task_manager.dart';

class FormsPage extends StatelessWidget {
  FormsPage({Key? key}) : super(key: key);

  final TextEditingController _codController = TextEditingController();
  final TextEditingController _projectController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  late TaskData data = TaskData();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          elevation: 1,
          color: Colors.white,
          child: Consumer<TaskManager>(
            builder: (_, taskManager, __) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextFormField(
                        controller: _codController,
                        // enabled: !userManager.loading,
                        decoration: const InputDecoration(
                          hintText: "Digite o código do projeto",
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.pages,
                            color: Colors.black,
                            size: 22.0,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        autocorrect: false,
                        validator: (email) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextFormField(
                        controller: _projectController,
                        // enabled: !userManager.loading,
                        decoration: const InputDecoration(
                          hintText: "Qual o nome do Projeto ?",
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.pages,
                            color: Colors.black,
                            size: 22.0,
                          ),
                        ),
                        autocorrect: false,
                        validator: (email) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextFormField(
                        controller: _descriptionController,
                        // enabled: !userManager.loading,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: "Adicione uma descrição",
                          border: OutlineInputBorder(),
                        ),
                        autocorrect: false,
                        validator: (description) {},
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          data.cod = int.parse(_codController.text);
                          data.description = _descriptionController.text;
                          data.project = _projectController.text;
                          taskManager.addTask(data: data, context: context);
                        },
                        child: const Text("Cadastrar"))
                  ],
                ),
              );
            },
          )),
    );
  }
}
