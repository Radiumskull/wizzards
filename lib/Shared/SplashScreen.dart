import 'package:flutter/material.dart';
import 'package:wizzards/Screens/Wrapper.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 10,
        navigateAfterSeconds: new AfterSplash(),
        title: new Text(
          'Welcome to Hogwarts',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: new Image.asset('assets/images/hogwarts.png'),
        backgroundColor: Color.fromRGBO(210, 170, 119, 1),
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () {},
        loaderColor: Colors.red);
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrapper();
  }
}
