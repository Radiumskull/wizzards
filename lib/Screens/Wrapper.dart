import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Screens/Authenticate/Authenticate.dart';
import 'package:wizzards/Models/User.dart';
import 'package:wizzards/Screens/Home/Home.dart';
import 'package:wizzards/Services/DatabaseService.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Scaffold(resizeToAvoidBottomPadding: false, body: Authenticate());
    } else {
      return StreamProvider<UserData>.value(
        value: DatabaseService(uid: user.uid).userData,
        child: Home(),
      );
    }
  }
}
