import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Models/User.dart';


class LoggedUserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);
    return Container(
      width: double.infinity,
        height: 250,
        color: Colors.amber,
        child : Column(
      children: <Widget>[
        SizedBox(height: 20,),
        Icon(Icons.person, size: 128,),
        SizedBox(height: 30,),
        Text( userData == null ? "null" : userData.name , style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),),
        Text(userData == null ? "null" : userData.email , style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
      ],
    ));
  }
}
