import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/user.dart';
import 'package:todoapp/services/datetime.dart';
import 'package:todoapp/state_manager/task_data.dart';
import 'package:todoapp/views/widgets/shared_widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  int index = 0;
  String task;
  final taskFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 0,
        title: Consumer<UserModel>(
          builder: (context, value, child) => FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Hey there, ${value.fullName.split(' ')[0].toString()}',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ).pOnly(left: 15),
          ),
        ),
        actions: [
          CircleAvatar(
                  backgroundColor: Colors.orange.withOpacity(0.15),
                  foregroundColor: Colors.black,
                  radius: 15,
                  child: Icon(Icons.person, size: 20))
              .pOnly(right: 15)
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Visibility(
                  visible: Provider.of<DataConnectionStatus>(context) ==
                      DataConnectionStatus.disconnected,
                  child: Container(
                    color: Colors.red,
                    child: Center(
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(Icons.wifi_off))),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(dateTimeService.ddddyyMMMM,
                            style: TextStyle(color: Colors.black))
                        .pOnly(bottom: 5),
                    Text('${Provider.of<TaskData>(context).taskCount} Tasks',
                        style: TextStyle(color: Colors.black)),
                  ],
                ).px(15),
                SizedBox(height: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 5, right: 5, top: 10),
                    decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.15),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10))),
                    child: TasksList(),
                  ),
                ),
                SizedBox(height: kToolbarHeight)
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: context.screenWidth,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10))),
                child: Column(
                  children: [
                    Divider(thickness: 2, height: 1).pOnly(top: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: TextField(
                            controller: taskFieldController,
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.black,
                                border: InputBorder.none,
                                labelText: "Add Task",
                                labelStyle: TextStyle(color: Colors.white)),
                            textAlign: TextAlign.start,
                            cursorWidth: 2.0,
                            onEditingComplete: () {
                              if (taskFieldController.text.isNotEmpty)
                                Provider.of<TaskData>(context, listen: false)
                                    .addTask(taskFieldController.text);
                              taskFieldController.clear();
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
