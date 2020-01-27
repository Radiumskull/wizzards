import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Models/User.dart';

class LoggedUserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);
    Color primaryColor = Colors.white;
    Color secondaryColor = Colors.red;
    Image profImage;
    if (userData == null) {
      primaryColor = Colors.white;
      secondaryColor = Colors.red;
      return Drawer();
    } else {
      if (userData.house == "hufflepuff") {
        primaryColor = Color.fromARGB(255, 255, 157, 10);
        secondaryColor = Color.fromARGB(100, 31, 30, 25);
      } else if (userData.house == "gryffindor") {
        primaryColor = Color.fromARGB(255, 102, 0, 0);
        secondaryColor = Color.fromARGB(150, 224, 157, 9);
      } else if (userData.house == "ravenclaw") {
        primaryColor = Color.fromARGB(255, 25, 57, 86);
        secondaryColor = Colors.red;
      } else if (userData.house == "slytherin") {
        primaryColor = Color.fromARGB(255, 46, 117, 28);
        secondaryColor = Color.fromARGB(100, 204, 204, 204);
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
                    color: Colors.white),
              ),
              Text(
                userData == null ? "null" : userData.email,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ));
    }
  }
}
