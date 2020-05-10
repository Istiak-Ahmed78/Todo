import 'package:flutter/material.dart';

class Priority {
  final String name;
  final Color color;
  final IconData icon;

  Priority(
      {this.name = "low",
      this.color = Colors.orange,
      this.icon = Icons.priority_high});
}
