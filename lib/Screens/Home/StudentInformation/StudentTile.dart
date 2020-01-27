import 'package:flutter/material.dart';
import 'package:wizzards/Models/User.dart';

class StudentTile extends StatelessWidget {
  final UserData student;
  final int index;

  StudentTile({this.index, this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
      elevation: 5,
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: CircleAvatar(
          backgroundColor: Colors.black54,
          child: Text(
            (index + 1).toString(),
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          radius: 25,
        ),
        title: Text(
          student.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        subtitle: Text("${student.email}\nFood: ${student.food}"),
      ),
    );
  }
}
