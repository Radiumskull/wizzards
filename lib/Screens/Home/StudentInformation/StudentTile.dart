import 'package:flutter/material.dart';
import 'package:wizzards/Models/User.dart';

class StudentTile extends StatelessWidget {
  final UserData userData;
  final int index;

  StudentTile({this.index, this.userData});

  @override
  Widget build(BuildContext context) {
    Color primaryColor;
    if (userData.house == "hufflepuff") {
      primaryColor = Color.fromARGB(255, 255, 157, 10);
    } else if (userData.house == "gryffindor") {
      primaryColor = Color.fromARGB(255, 102, 0, 0);
    } else if (userData.house == "ravenclaw") {
      primaryColor = Color.fromARGB(255, 25, 57, 86);
    } else if (userData.house == "slytherin") {
      primaryColor = Color.fromARGB(255, 46, 117, 28);
    } else if (userData.house == "") {
      primaryColor = Colors.black;
    }

    return Card(
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
      elevation: 5,
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: CircleAvatar(
          backgroundColor: primaryColor,
          child: Text(
            (index + 1).toString(),
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          radius: 25,
        ),
        title: Text(
          userData.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        subtitle: Text("${userData.email}\nFood: ${userData.food}"),
      ),
    );
  }
}
