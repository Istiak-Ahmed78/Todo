import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/proejct_data.dart';
import 'package:todoapp/providers/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String _currentSelectedValue;
  String _currentSelectedPriorityValue;
  String taskTitle;

  @override
  Widget build(BuildContext context) {
    List<String> _projects = [];
    Provider.of<ProjectData>(context).projectLists.forEach((element) =>
        element.name == "Add Project" ? null : _projects.add(element.name));

    List<String> _priority = [];
    priorities.forEach((element) =>
        element.name == "None" ? null : _priority.add(element.name));

    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "ADD TASK",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  border: InputBorder.none,
                  labelText: "Task Name",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 15)),
              textAlign: TextAlign.start,
              cursorWidth: 2.0,
              onChanged: (newTask) {
                taskTitle = newTask;
              },
            ),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  border: InputBorder.none,
                  labelText: "Due Date",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 15)),
              textAlign: TextAlign.start,
              cursorWidth: 2.0,
              onChanged: (newProject) {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                  color: Colors.redAccent, fontSize: 16.0),
                              labelText: "Add Project",
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.black12,
                            ),
                            isEmpty: _currentSelectedValue == '',
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _currentSelectedValue,
                                isDense: true,
                                onChanged: (newSelectedPriority) {
                                  setState(() {
                                    _currentSelectedValue = newSelectedPriority;
                                    state.didChange(newSelectedPriority);
                                  });
                                },
                                items: _projects.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      )),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                  color: Colors.redAccent, fontSize: 16.0),
                              labelText: "Add Priority",
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.black12,
                            ),
                            isEmpty: _currentSelectedPriorityValue == '',
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _currentSelectedPriorityValue,
                                isDense: true,
                                onChanged: (newSelectedPriority) {
                                  setState(() {
                                    _currentSelectedPriorityValue =
                                        newSelectedPriority;
                                    state.didChange(newSelectedPriority);
                                  });
                                },
                                items: _priority.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      )),
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black.withOpacity(0.1),
                border: InputBorder.none,
                labelText: "Add a Description",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black45,
                ),
              ),
              textAlign: TextAlign.start,
              onChanged: (newProject) {},
            ),
            SizedBox(height: 10),
            MaterialButton(
              child: Text("Create Task",
                  style: TextStyle(fontSize: 20.0, color: Colors.white)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0)),
              minWidth: 200.0,
              height: 45,
              color: Colors.blue[500],
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(taskTitle, _currentSelectedPriorityValue);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
