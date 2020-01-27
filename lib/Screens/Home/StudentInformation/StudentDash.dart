import 'package:flutter/material.dart';

class StudentDash extends StatelessWidget {
  final int studentsCounts;
  final int vegFood;
  StudentDash({this.studentsCounts, this.vegFood});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 40),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 20.0, // has the effect of softening the shadow
                spreadRadius: 5.0, // has the effect of extending the shadow
                offset: Offset(
                  10.0, // horizontal, move right 10
                  10.0, // vertical, move down 10
                ),
              )
            ],
            color: Colors.black12,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              "Students",
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  letterSpacing: 12),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Dashboard",
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  letterSpacing: 12),
            ),
          ),
          Row(
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
                          style: TextStyle(
                              fontSize: 64, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Enrolled",
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.w600),
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
                          style: TextStyle(
                              fontSize: 64, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Veg",
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.w600),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ]));
  }
}
