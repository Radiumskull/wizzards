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
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        actions: <Widget>[
          FlatButton(
            child: Text("Logout"),
            onPressed: () async {
             await _auth.signOut();
            },
          ),
        ],
        title: Text("Wizzards"),
      ),
      body: Container(child : Column(
        children: <Widget>[
          Container(
            height: 350,
          child : PointsChartPage(),
          ),
          Text("Events", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),),
          Expanded( child: EventInformation()),
        ],
      ),
    ));
  }
}
