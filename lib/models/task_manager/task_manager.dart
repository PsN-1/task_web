import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mobile/models/task_data.dart';

class TaskManager extends ChangeNotifier {
  late List<TaskData> _taskData;
  List<TaskData> get taskData => _taskData;

  TaskManager() {
    getTask();
  }
  Future<void> getTask() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("Tasks").get();
    _taskData =
        querySnapshot.docs.map((e) => TaskData.fromDocument(e)).toList();
    notifyListeners();
  }
}
