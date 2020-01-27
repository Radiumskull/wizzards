import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class Carousal extends StatefulWidget {
  @override
  _CarousalState createState() => _CarousalState();
}

class _CarousalState extends State<Carousal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.pop(context), label: Text(" Back ")),
      body: Container(
        height: 400,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: <Widget>[
              Carousel(
                dotIncreaseSize: 1.5,
                boxFit: BoxFit.scaleDown,
                images: [
                  AssetImage("assets/images/gryffindor.png"),
                  AssetImage("assets/images/hufflepuff.png"),
                  AssetImage("assets/images/ravenclaw.png"),
                  AssetImage("assets/images/slytherin.png"),
                ],
                autoplay: true,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
