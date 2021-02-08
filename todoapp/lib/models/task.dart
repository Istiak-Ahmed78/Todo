import 'package:todoapp/models/priority.dart';

class Task {
  String title;
  String subtitle;
  String assignedUid;
  List<Task> subtasks;
  DateTime deadLine;
  Priority priority;
  bool isDone;
  Task({
    this.title,
    this.subtitle,
    this.assignedUid,
    this.subtasks,
    this.deadLine,
    this.priority,
    this.isDone,
  });

  void toggleDone() {
    isDone = !isDone;
  }
}
