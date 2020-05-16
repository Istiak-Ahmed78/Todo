import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/components/widgets/calendar.dart';
import 'package:todoapp/components/widgets/circular_avatar.dart';
import 'package:todoapp/components/widgets/tasks_list.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/services/datetime.dart';
import 'add_task_screen.dart';
import 'package:todoapp/providers/task_data.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// AppBar is kept simple. We will use SVG format custom icon for the
      /// leading icon. Otherwise, we can check packages for custom icon that
      /// matches our design
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
      ),

      /// Brings up a bottomSheet and triggers AddTaskScreen.
      /// AddTaskScreen handles adding task via provider
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(),
          );
        },
      ),
      body: SafeArea(
        child: Column(
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
                    child: Text(
                      "No Internet Available!",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),

            ///Holds Date, Greetings, Username, User Profile Picture
            ///Total no of tasks and Calendar
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 25.0, // soften the shadow
                  spreadRadius: 2.0,
                  offset: Offset(
                    0.0, // Move to right 10  horizontally
                    15.0, // Move to bottom 10 Vertically
                  ),
                )
              ]),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 20, bottom: 30, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ///DateTime
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            dateTimeService.ddddyyMMMM,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ///Greetings and Name
                            Text(
                              'GOOD MORNING\nSARAH',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w700),
                            ),

                            ///User Avatar
                            CircularAvatar(
                              url:
                                  "https://randomuser.me/api/portraits/women/17.jpg",
                            )
                          ],
                        ),

                        ///Amount of Tasks left
                        Text(
                          '${Provider.of<TaskData>(context).taskCount} Tasks',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///Calendar widget
                  Calendar(),
                ],
              ),
            ),
            SizedBox(height: 10),

            ///Holds TaskList
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 5),
                //color: Color(0xFFEFEFEF),
                child: TasksList(),
              ),
            )
          ],
        ),
      ),

      ///Work needed
      /*bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (index) => setState(() => this.index = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.playlist_add), title: Text("")),
          BottomNavigationBarItem(
              icon: Icon(Icons.developer_board), title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("")),
        ],
      ),*/
    );
  }
}
