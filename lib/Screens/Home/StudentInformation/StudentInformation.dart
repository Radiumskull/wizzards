import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Models/ColorPallete.dart';
import 'package:wizzards/Models/User.dart';
import 'package:wizzards/Services/DatabaseService.dart';
import 'package:wizzards/Screens/Home/StudentInformation/StudentList.dart';

class StudentInformation extends StatefulWidget {
  final ColorPallete colorPallete;
  StudentInformation(this.colorPallete);
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
          icon: Icon(Icons.arrow_back_ios),
          backgroundColor: Color.fromARGB(255, 27, 38, 44),
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text(
            " Back ",
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: widget.colorPallete.secondaryColor,
            child: Column(
              children: <Widget>[
                StudentList(widget.colorPallete),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
