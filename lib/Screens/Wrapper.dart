import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Screens/Authenticate/Authenticate.dart';
import 'package:wizzards/Models/User.dart';
import 'package:wizzards/Screens/Home/Home.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null){
      return Authenticate();
    } else {
      return Home();
    }
  }
}
