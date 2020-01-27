import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Models/User.dart';
import 'package:wizzards/Screens/Home/StudentInformation/StudentDash.dart';
import 'package:wizzards/Screens/Home/StudentInformation/StudentTile.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    int vegFood = 0;
    final students = Provider.of<List<UserData>>(context);
    if (students == null) {
      return Container();
    } else {
      for (int i = 0; i < students.length; i++) {
        if (students[i].food == "Veg") {
          vegFood += 1;
        }
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          StudentDash(
            studentsCounts: students.length,
            vegFood: vegFood,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: students.length,
            itemBuilder: (context, index) {
              return (StudentTile(index: index, student: students[index]));
            },
          )
        ],
      );
    }
  }
}
