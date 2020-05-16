import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/proejct_data.dart';
import 'package:todoapp/screens/project/add_project_screen.dart';
import 'package:todoapp/screens/project/project_details_screen.dart';

class ProjectsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectData>(
      builder: (context, projectData, child) {
        return GridView.builder(
          itemCount: projectData.projectCount,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            ///Check if the current index is last element of the list, if yes return true.
            bool addProjectChecker =
                projectData.projectLists[index].name == "Add Project";
            return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 0.0,
                  color: projectData.projectLists[index].backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ///Project Icon
                        Icon(
                          projectData.projectLists[index].iconData,
                          color:
                              addProjectChecker ? Colors.black45 : Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        ///Project Name
                        Text(
                          "${projectData.projectLists[index].name}",
                          style: TextStyle(
                              color: addProjectChecker
                                  ? Colors.black45
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        /// No of Tasks
                        addProjectChecker
                            ? Text("")
                            : Text(
                                "No of Tasks",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {
                addProjectChecker
                    ? showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => AddProjectScreen(),
                      )
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProjectDetailsScreen(
                                  project: projectData.projectLists[index],
                                )));
              },
              onLongPress: () {
                addProjectChecker
                    ? Container()
                    : projectData
                        .deleteProject(projectData.projectLists[index]);
              },
            );
          },
        );
      },
    );
  }
}
