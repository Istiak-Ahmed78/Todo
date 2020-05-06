import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/task_data.dart';
import 'package:todoapp/screens/tasks_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Everything related to Tasks is handled by TaskData.
    /// Provider is used for State Management Helper.
    return ChangeNotifierProvider(
      create: (_) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
