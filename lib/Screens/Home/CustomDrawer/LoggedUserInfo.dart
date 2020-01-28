import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Models/ColorPallete.dart';
import 'package:wizzards/Models/User.dart';

class LoggedUserInfo extends StatelessWidget {
  final ColorPallete colorPallete;
  LoggedUserInfo(this.colorPallete);
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);
    Color primaryColor;
    Image profImage;
    if (userData == null) {
      primaryColor = Colors.white;
      return Container();
    } else {
      if (userData.house == "hufflepuff") {
        primaryColor = Color.fromARGB(255, 255, 157, 10);
      } else if (userData.house == "gryffindor") {
        primaryColor = Color.fromARGB(255, 102, 0, 0);
      } else if (userData.house == "ravenclaw") {
        primaryColor = Color.fromARGB(255, 25, 57, 86);
      } else if (userData.house == "slytherin") {
        primaryColor = Color.fromARGB(255, 46, 117, 28);
      } else if (userData.house == "") {
        primaryColor = Colors.black;
      }
      if (userData == null) {
        profImage = Image.asset(
          'assets/images/hogwarts.png',
          scale: 8,
        );
      } else {
        if (userData.house == "hufflepuff") {
          profImage = Image.asset(
            'assets/images/hufflepuff.png',
            scale: 2,
          );
        } else if (userData.house == "gryffindor") {
          profImage = Image.asset(
            'assets/images/gryffindor.png',
            scale: 2,
          );
        } else if (userData.house == "ravenclaw") {
          profImage = Image.asset(
            'assets/images/ravenclaw.png',
            scale: 2,
          );
        } else if (userData.house == "slytherin") {
          profImage = Image.asset(
            'assets/images/slytherin.png',
            scale: 2,
          );
        } else if (userData.house == "") {
          profImage = Image.asset(
            'assets/images/hogwarts.png',
            scale: 7,
          );
        }
      }

      return Container(
          width: double.infinity,
          height: 250,
          color: primaryColor,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              // Icon(Icons.person, size: 128,),
              profImage,
              SizedBox(
                height: 20,
              ),
              Text(
                userData == null ? "null" : userData.name.split(" ")[0],
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: colorPallete.textColor),
              ),
              Text(
                userData == null ? "null" : userData.email,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: colorPallete.textColor),
              ),
            ],
          ));
    }
  }
}
