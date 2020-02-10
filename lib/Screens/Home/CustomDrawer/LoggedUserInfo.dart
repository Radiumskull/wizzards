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
    Image profImage;
    if (userData == null) {
      return Container();
    } else {
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
          // height: 300,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          color: colorPallete.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: <Widget>[
              SizedBox(
                height: 50,
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
                    fontWeight: FontWeight.w700,
                    color: colorPallete.textColor),
              ),
              Text(
                userData == null ? "null" : userData.email,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: colorPallete.textColor),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                width: 150,
                height: 40,
               decoration : BoxDecoration(
                 color: colorPallete.secondaryColor,
                 borderRadius: BorderRadius.all(Radius.circular(20))
               ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Points :",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: userData.house == '' ? Colors.black : colorPallete.textColor,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      userData == null ? "0" : userData.point,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: userData.house == '' ? Colors.black : colorPallete.textColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ));
    }
  }
}
