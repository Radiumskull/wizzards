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
          backgroundColor: Colors.red,
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text(" Back "),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: Colors.black12,
            child: Column(
              children: <Widget>[
                StudentList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
