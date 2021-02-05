import 'package:todoapp/models/priority.dart';

class Task {
  final String name;
  bool isDone;
  Priority priority;

  Task({this.name, this.isDone = false, this.priority});

  void toggleDone() {
    isDone = !isDone;
  }
}
