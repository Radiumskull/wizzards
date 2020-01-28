import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Models/ColorPallete.dart';
import 'package:wizzards/Models/User.dart';
import 'package:wizzards/Screens/Home/CustomDrawer/CustomDrawer.dart';
import 'package:wizzards/Screens/Home/EventInformation/EventInformation.dart';
import 'package:wizzards/Screens/Home/PointsChart/PointsChartPage.dart';
import 'package:wizzards/Services/Auth.dart';
import 'package:wizzards/Shared/Loading.dart';

class Home extends StatelessWidget {
  ColorPallete colorPallete;

  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();
    final userData = Provider.of<UserData>(context);

    if (userData == null) {
      colorPallete = ColorPallete(Colors.black, Colors.white, Colors.black);
      return Scaffold(body: Loading());
    } else {
      if (userData.house == "hufflepuff") {
        colorPallete = ColorPallete(Color.fromARGB(255, 255, 157, 10),
            Color.fromARGB(100, 31, 30, 25), Colors.black);
      } else if (userData.house == "gryffindor") {
        colorPallete = ColorPallete(Color.fromARGB(255, 102, 0, 0),
            Color.fromARGB(150, 224, 157, 9), Colors.white);
      } else if (userData.house == "ravenclaw") {
        colorPallete = ColorPallete(Color.fromARGB(255, 25, 57, 86),
            Color.fromARGB(150, 142, 80, 28), Colors.white);
      } else if (userData.house == "slytherin") {
        colorPallete = ColorPallete(Color.fromARGB(255, 46, 117, 28),
            Color.fromARGB(100, 204, 204, 204), Colors.white);
      } else {
        colorPallete = ColorPallete(Colors.black, Colors.white, Colors.white);
      }

      return Scaffold(
        drawer: CustomDrawer(colorPallete, userData.house),
        appBar: AppBar(
          iconTheme: new IconThemeData(color: colorPallete.textColor),
          backgroundColor: colorPallete.primaryColor,
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
                  style: TextStyle(fontSize: 16, color: colorPallete.textColor),
                ),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
            ),
          ],
          title: Text(
            "Wizzards",
            style: TextStyle(
                color: colorPallete.textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: colorPallete.secondaryColor,
            child: Column(
              children: <Widget>[
                PointsChartPage(),
                EventInformation(),
                SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}
