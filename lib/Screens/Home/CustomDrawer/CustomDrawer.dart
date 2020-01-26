import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Screens/Home/CarousalPage/Carousal.dart';
import 'package:wizzards/Screens/Home/CustomDrawer/LoggedUserInfo.dart';
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
            children: <Widget>[
              LoggedUserInfo(),
              FlatButton(
                child: Text("Students Dashboard", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => StudentInformation()));
                },
              ),
              FlatButton(
                child: Text("Throwback to Neophytes", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => Carousal()));
                },
              ),
            ],
          ),

    ),
    );
  }
}
