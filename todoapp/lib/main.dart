import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/proejct_data.dart';
import 'package:todoapp/providers/task_data.dart';
import 'package:todoapp/screens/navigator_screen.dart';
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
        StreamProvider<DataConnectionStatus>(
            create: (_) =>
                DataConnectivityService().connectivityStreamController.stream)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavigatorScreen(),
      ),
    );
  }
}
