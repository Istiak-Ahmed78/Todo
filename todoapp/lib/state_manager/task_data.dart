import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/models/priority.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/services/storage.dart';

List<Priority> priorities = [
  Priority(name: "Low", color: Colors.yellow, icon: Icons.priority_high),
  Priority(
      name: "Medium",
      color: Colors.deepOrangeAccent,
      icon: Icons.priority_high),
  Priority(name: "High", color: Colors.red, icon: Icons.priority_high),
  Priority(name: "None", color: Colors.white, icon: Icons.priority_high)
];

class TaskData extends ChangeNotifier {
  var _selectedPriority;

  List<Task> _tasks = [
    Task(title: "Click the + button to add task"),
    Task(title: "long press to delete"),
    Task(title: "Be productive all day"),
  ];

  int get taskCount => _tasks.length;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void addTask(String newTaskTitle, {String priority}) {
    if (priority == "Low") {
      _selectedPriority = priorities[0];
    } else if (priority == "Medium") {
      _selectedPriority = priorities[1];
    } else if (priority == "High") {
      _selectedPriority = priorities[2];
    } else {
      _selectedPriority = priorities[3];
    }
    final task = Task(title: newTaskTitle, priority: _selectedPriority);
    _tasks.add(task);
    writeContent(newTaskTitle);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    readcontent().then((content) => print(content));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}
