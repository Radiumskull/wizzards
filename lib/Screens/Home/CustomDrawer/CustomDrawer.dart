import 'package:flutter/material.dart';
import 'package:wizzards/Models/ColorPallete.dart';
import 'package:wizzards/Screens/Home/CarousalPage/CarousalPage.dart';
import 'package:wizzards/Screens/Home/CustomDrawer/LoggedUserInfo.dart';
import 'package:wizzards/Screens/Home/EventUpdates/EventUpdatesPage.dart';
import 'package:wizzards/Screens/Home/QuizPage/QuizPage.dart';
import 'package:wizzards/Screens/Home/StudentInformation/StudentInformation.dart';

class CustomDrawer extends StatefulWidget {
  final ColorPallete colorPallete;
  final String house;
  CustomDrawer(this.colorPallete, this.house);
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: widget.colorPallete.secondaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            LoggedUserInfo(widget.colorPallete),
            SizedBox(
              height: 15,
            ),
            ButtonTheme(
              height: 60,
              child: FlatButton(
                color: Color(0x3282b8),
                child: Container(
                  width: double.infinity,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Icon(Icons.dashboard),
                      Text(
                        "Students Dashboard",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              StudentInformation(widget.colorPallete)));
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ButtonTheme(
              height: 60,
              child: FlatButton(
                color: Color(0x3282b8),
                child: Container(
                  width: double.infinity,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Icon(Icons.dashboard),
                      Text(
                        "Event Updates",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              EventUpdatesPage(widget.colorPallete)));
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ButtonTheme(
              height: 60,
              child: FlatButton(
                color: Color(0x3282b8),
                child: Center(
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.view_carousel),
                        Text(
                          "Throwback To Neophytes",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => CarousalPage()));
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            widget.house == ''
                ? ButtonTheme(
                    height: 60,
                    child: FlatButton(
                      color: Color(0x3282b8),
                      child: Center(
                        child: Container(
                          width: double.infinity,
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.home),
                              Text(
                                "House Selection",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => QuizPage()));
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
