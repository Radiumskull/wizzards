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
        primaryColor = Color.fromARGB(255, 255, 157, 10);
        secondaryColor = Color.fromARGB(100, 31, 30, 25);
      } else if (userData.house == "gryffindor") {
        primaryColor = Color.fromARGB(255, 102, 0, 0);
        secondaryColor = Color.fromARGB(150, 224, 157, 9);
      } else if (userData.house == "ravenclaw") {
        primaryColor = Color.fromARGB(255, 25, 57, 86);
        secondaryColor = Color.fromARGB(150, 142, 80, 28);
      } else if (userData.house == "slytherin") {
        primaryColor = Color.fromARGB(255, 46, 117, 28);
        secondaryColor = Color.fromARGB(100, 204, 204, 204);
      }

      return Scaffold(
        drawer: CustomDrawer(secondaryColor, userData.house),
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
                EventInformation(),
              ],
            ),
          ),
        ),
      );
    }
  }
}
