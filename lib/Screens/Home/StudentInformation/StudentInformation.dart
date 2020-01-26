import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Models/User.dart';
import 'package:wizzards/Services/DatabaseService.dart';
import 'package:wizzards/Screens/Home/StudentInformation/StudentList.dart';



class StudentInformation extends StatefulWidget {
  @override
  _StudentInformationState createState() => _StudentInformationState();
}

class _StudentInformationState extends State<StudentInformation> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<UserData>>.value(
        value: DatabaseService().students,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text(" Back "),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              StudentList(),
            ],
          ),
        ),
      ),

    );
  }
}
