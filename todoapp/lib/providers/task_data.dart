import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/components/models/priority.dart';
import '../components/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  //var _selectedPriority;

  List<Task> _tasks = [
    Task(name: "Buy Milk"),
    Task(name: "Buy Milk"),
    Task(name: "Buy Milk"),
  ];

  List<Priority> _priorities = [
    Priority(name: "Low", color: Colors.orange, icon: Icons.priority_high),
    Priority(
        name: "Medium", color: Colors.deepOrange, icon: Icons.priority_high),
    Priority(name: "High", color: Colors.red, icon: Icons.priority_high),
    Priority(name: "None", color: Colors.black12, icon: Icons.priority_high)
  ];

  void addTask(String newTaskTitle /*, String priority*/) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    /*if (priority == "Low") {
      _selectedPriority = _priorities[0];
      //notifyListeners();
    } else if (priority == "Medium") {
      _selectedPriority = _priorities[1];
      //notifyListeners();
    } else if (priority == "High") {
      _selectedPriority = _priorities[2];
      //notifyListeners();
    }*/
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount => _tasks.length;

  UnmodifiableListView<Priority> get priorities =>
      UnmodifiableListView(_priorities);

  //get getSelectedPriority => _selectedPriority ?? _priorities[3];
}
