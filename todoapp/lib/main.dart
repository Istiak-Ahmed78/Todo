import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state_manager/auth_provider.dart';
import 'state_manager/project_data.dart';
import 'state_manager/task_data.dart';
import 'views/screens/auth_screen/auth_screen.dart';
import 'package:todoapp/services/data_connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskData()),
        ChangeNotifierProvider(create: (_) => ProjectData()),
        ChangeNotifierProvider(create: (_) => Auth()),
        StreamProvider<DataConnectionStatus>(create: (_) => DataConnectivityService().connectivityStreamController.stream)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //TODO: Log In Check
        home: AuthScreen(),
      ),
    );
  }
}
