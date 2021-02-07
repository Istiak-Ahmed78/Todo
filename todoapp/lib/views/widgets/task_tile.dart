import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/models/priority.dart';

/// Main 2 Feature:
/// longPressToDelete & Current time of adding task
/// Will be kept simple. All logic will be handled in it's parent widget.
class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressCallback;
  final Priority priorityIconData;

  TaskTile({
    this.isChecked,
    this.taskTitle,
    this.checkboxCallback,
    this.longPressCallback,
    this.priorityIconData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: longPressCallback,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircularCheckBox(
                activeColor: Colors.green,
                value: isChecked,
                onChanged: checkboxCallback,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              Flexible(
                child: Text(
                  taskTitle,
                  style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null),
                ),
              ),
              //Icon(priorityIconData.icon, color: priorityIconData.color)
            ],
          ),
          Divider(height: 1),
        ],
      ),
    );
  }
}
