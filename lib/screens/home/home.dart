import 'package:flutter/material.dart';
import 'package:wizzards/Screens/Home/CustomDrawer/CustomDrawer.dart';
import 'package:wizzards/Screens/Home/EventInformation/EventInformation.dart';
import 'package:wizzards/Screens/Home/PointsChart/PointsChartPage.dart';
import 'package:wizzards/Services/Auth.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 38, 44),
        actions: <Widget>[
          ButtonTheme(
            height: 5,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30))),
              color: Colors.white24,
              child: Text(
                "Logout",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ),
        ],
        title: Text("Wizzards"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.black12,
          child: Column(
            children: <Widget>[
              PointsChartPage(),
              EventInformation(),
            ],
          ),
        ),
      ),
    );
  }
}
