import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/login_screen_(need%20to%20move)/auth_provider.dart';
import 'package:todoapp/login_screen_(need%20to%20move)/login_screen.dart';
import 'package:todoapp/providers/project_data.dart';
import 'package:todoapp/providers/task_data.dart';
import 'package:todoapp/services/data_connectivity.dart';

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
        ChangeNotifierProvider(create: (_) => Auth()),
        StreamProvider<DataConnectionStatus>(
            create: (_) =>
                DataConnectivityService().connectivityStreamController.stream)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: NavigatorScreen(),
        home: LoginScreen(),
      ),
    );
  }
}
