import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Models/User.dart';
import 'package:wizzards/Screens/Home/CustomDrawer/CustomDrawer.dart';
import 'package:wizzards/Screens/Home/EventInformation/EventInformation.dart';
import 'package:wizzards/Screens/Home/PointsChart/PointsChartPage.dart';
import 'package:wizzards/Services/Auth.dart';
import 'package:wizzards/Shared/Loading.dart';

class Home extends StatelessWidget {
  Color primaryColor, secondaryColor;

  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();
    final userData = Provider.of<UserData>(context);

    if (userData == null) {
      primaryColor = Colors.white;
      secondaryColor = Colors.red;
      return Scaffold(body: Loading());
    } else {
      if (userData.house == "hufflepuff") {
        primaryColor = Colors.yellow;
        secondaryColor = Colors.black;
      } else if (userData.house == "gryffindor") {
        primaryColor = Colors.red;
        secondaryColor = Colors.yellowAccent;
      } else if (userData.house == "ravenclaw") {
        primaryColor = Colors.blue;
        secondaryColor = Colors.black;
      } else if (userData.house == "slytherin") {
        primaryColor = Colors.green;
        secondaryColor = Colors.grey;
      }

      return Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          backgroundColor: primaryColor,
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
            color: secondaryColor,
            child: Column(
              children: <Widget>[
                PointsChartPage(),
                SizedBox(height: 500, child: EventInformation()),
              ],
            ),
          ),
        ),
      );
    }
  }
}
