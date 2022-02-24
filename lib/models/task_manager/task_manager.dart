import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mobile/models/task_data.dart';

class TaskManager extends ChangeNotifier {
  late List<TaskData> _taskData;
  List<TaskData> get taskData => _taskData;
  FirebaseAuth _auth = FirebaseAuth.instance;

  late int _taskCountActive = 0, _taskCountDone = 0;

  int get taskCountActive => _taskCountActive;
  int get tasksCountDone => _taskCountDone;

  TaskManager() {
    getTask();
  }

  Future<void> getTask() async {
    User currentUser = await _auth.currentUser!;

    if (currentUser.uid != null) {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("Tasks").get();
      _taskData = querySnapshot.docs
          .map((e) => TaskData.fromDocument(e))
          .where((element) => element.idEmployer == currentUser.uid)
          .toList();
      _taskCountDone =
          _taskData.where((element) => element.done == true).toList().length;
      _taskCountActive =
          _taskData.where((element) => element.done == false).toList().length;
      notifyListeners();
    }
  }

  addTask({required TaskData data, required BuildContext context}) async {
    User currentUser = await _auth.currentUser!;

    await FirebaseFirestore.instance.collection("Tasks").add({
      "cod": data.cod,
      "description": data.description,
      "done": false,
      "idEmployer": currentUser.uid,
      "image": "url",
      "project": data.project
    });
    notifyListeners();
    await getTask();
    Navigator.pushNamed(context, "/home");
  }
}
