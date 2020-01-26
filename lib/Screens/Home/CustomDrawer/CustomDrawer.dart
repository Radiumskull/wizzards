import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Screens/Home/CustomDrawer/LoggedUserInfo.dart';
import 'package:wizzards/Screens/Home/CarousalPage/Carousal.dart';
import 'package:wizzards/Screens/Home/PointsChart/PointsChartPage.dart';
import 'package:wizzards/Screens/Home/StudentInformation/StudentInformation.dart';
import 'package:wizzards/Services/DatabaseService.dart';
import 'package:wizzards/Models/User.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamProvider.value(
      updateShouldNotify: (context, user) => true,
      value: DatabaseService(uid: user.uid).userData,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            LoggedUserInfo(),
            FlatButton(
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => StudentInformation()));
              },
            ),
            FlatButton(
              child: Center(
                child: Container(
                  width: double.infinity,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.view_carousel),
                      Text(
                        " Throwback To Neophytes",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Carousal()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
