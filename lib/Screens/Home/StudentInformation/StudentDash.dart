import 'package:flutter/material.dart';

class StudentDash extends StatelessWidget {
  final int studentsCounts;
  final int vegFood;
  StudentDash({this.studentsCounts, this.vegFood});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 150,
          width: 180,
          child: Card(
              elevation: 10,
              child: Column(
                children: <Widget>[
                  Text(
                    studentsCounts.toString(),
                    style: TextStyle(fontSize: 64, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Enrolled",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
                  )
                ],
              )),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 150,
          width: 180,
          child: Card(
              elevation: 10,
              child: Column(
                children: <Widget>[
                  Text(
                    vegFood.toString(),
                    style: TextStyle(fontSize: 64, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Veg",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
                  )
                ],
              )),
        ),
      ],
    ));
  }
}
