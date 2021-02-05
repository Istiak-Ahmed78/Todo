import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/auth_provider.dart';
import 'package:todoapp/providers/project_data.dart';
import 'package:todoapp/providers/task_data.dart';
import 'package:todoapp/screens/auth_screen/auth_screen.dart';
import 'package:todoapp/services/data_connectivity.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

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
        home: AuthScreen(),
      ),
    );
  }
}
