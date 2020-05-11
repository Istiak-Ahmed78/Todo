import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/priority_data.dart';
import 'package:todoapp/providers/proejct_data.dart';
import 'package:todoapp/providers/task_data.dart';
import 'package:todoapp/screens/navigator_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Everything related to Tasks is handled by TaskData.
    /// Provider is used for State Management Helper.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskData()),
        ChangeNotifierProvider(create: (_) => ProjectData()),
        ChangeNotifierProvider(create: (_) => PriorityData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavigatorScreen(),
      ),
    );
  }
}
