import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/proejct_data.dart';

class AddProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String projectTitle;
    String projectDescription;
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Add Project",
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
                  labelText: "Project Name",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 15)),
              textAlign: TextAlign.start,
              cursorWidth: 2.0,
              onChanged: (newProject) {
                projectTitle = newProject;
              },
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  border: InputBorder.none,
                  labelText: "Due Date",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 15)),
              textAlign: TextAlign.start,
              cursorWidth: 2.0,
              //onChanged: (newProject) {},
            ),
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.person_outline),
                  labelText: "Add others in this project"),
              textAlign: TextAlign.start,
              //onChanged: (newProject) {},
            ),
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Add a Description",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black38,
                ),
              ),
              textAlign: TextAlign.start,
              onChanged: (description) {
                projectDescription = description;
              },
            ),
            SizedBox(height: 10),
            MaterialButton(
              child: Text("Create Project",
                  style: TextStyle(fontSize: 20.0, color: Colors.white)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0)),
              minWidth: 200.0,
              height: 45,
              color: Colors.blue[500],
              onPressed: () {
                Provider.of<ProjectData>(context, listen: false).addProject(
                    newProjectTitle: projectTitle,
                    newProjectDescription: projectDescription);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
