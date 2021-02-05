import 'package:flutter/material.dart';

class Project {
  final String name;
  final Color backgroundColor;
  final IconData iconData;
  final String description;
  int numberOfTasks;
  int numberOfTeamMember;

  Project({this.name, this.backgroundColor = Colors.lightBlueAccent, this.iconData = Icons.border_color, this.description});
}
