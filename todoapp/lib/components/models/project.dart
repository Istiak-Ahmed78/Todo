import 'package:flutter/material.dart';

class Project {
  final String name;
  final Color backgroundColor;
  final IconData iconData;
  final String description;
  int numberOfTasks;
  int numberOfTeamMember;

  Project({this.name, this.backgroundColor, this.iconData, this.description});
}
