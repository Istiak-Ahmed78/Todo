import 'package:flutter/material.dart';
import 'package:todoapp/components/models/project.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final Project project;

  ProjectDetailsScreen({Key key, @required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          project.name,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: Text(project.description)),
      ),
    );
  }
}
