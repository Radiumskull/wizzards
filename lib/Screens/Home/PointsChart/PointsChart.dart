import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Shared/FlutterProgressBar.dart';
import 'package:wizzards/Models/Points.dart';

class PointsChart extends StatefulWidget {
  @override
  _PointsChartState createState() => _PointsChartState();
}

class _PointsChartState extends State<PointsChart> {
  @override
  Widget build(BuildContext context) {
    int gryffindorPoints,
        hufflepuffPoints,
        ravenclawPoints,
        slytherinPoints,
        gpoints,
        hpoints,
        spoints,
        rpoints;
    final points = Provider.of<Points>(context);
    print("Points is NUll");
    if (points == null) {
      gryffindorPoints = ((25 / 100) * 100).toInt();
      hufflepuffPoints = ((25 / 100) * 100).toInt();
      ravenclawPoints = ((25 / 100) * 100).toInt();
      slytherinPoints = ((25 / 100) * 100).toInt();
      rpoints = 25;
      gpoints = 25;
      spoints = 25;
      hpoints = 25;
    } else {
      gryffindorPoints =
          ((points.gryffinforPoints / points.totalPoints) * 100).toInt();
      hufflepuffPoints =
          ((points.hufflepuffPoints / points.totalPoints) * 100).toInt();
      ravenclawPoints =
          ((points.ravenclawPoints / points.totalPoints) * 100).toInt();
      slytherinPoints =
          ((points.slytherinPoints / points.totalPoints) * 100).toInt();
      rpoints = points.ravenclawPoints;
      gpoints = points.gryffinforPoints;
      spoints = points.slytherinPoints;
      hpoints = points.hufflepuffPoints;
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 10, top: 10),
                child: Image.asset(
                  'assets/images/gryffindor.png',
                  height: 64,
                ),
              ),
              Container(
                height: 200,
                child: FAProgressBar(
                  size: 40,
                  animatedDuration: Duration(milliseconds: 500),
                  borderColor: Colors.black,
                  progressColor: Color.fromARGB(255, 127, 9, 9),
                  borderRadius: 20,
                  backgroundColor: Colors.white,
                  borderWidth: 1,
                  maxValue: 100,
                  currentValue: gryffindorPoints + 30,
                  verticalDirection: VerticalDirection.up,
                  direction: Axis.vertical,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                gpoints.toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "Gryffindor",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 10, top: 10),
                child: Image.asset(
                  'assets/images/hufflepuff.png',
                  height: 64,
                ),
              ),
              Container(
                height: 200,
                child: FAProgressBar(
                  size: 40,
                  animatedDuration: Duration(milliseconds: 500),
                  borderColor: Colors.black,
                  borderWidth: 1,
                  progressColor: Color.fromARGB(255, 255, 157, 10),
                  borderRadius: 20,
                  maxValue: 100,
                  backgroundColor: Colors.white,
                  currentValue: hufflepuffPoints + 30,
                  verticalDirection: VerticalDirection.up,
                  direction: Axis.vertical,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                hpoints.toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "Hufflepuff",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 10, top: 10),
                child: Image.asset(
                  'assets/images/ravenclaw.png',
                  height: 64,
                ),
              ),
              Container(
                height: 200,
                child: FAProgressBar(
                  size: 40,
                  animatedDuration: Duration(milliseconds: 500),
                  borderColor: Colors.black,
                  borderWidth: 1,
                  backgroundColor: Colors.white,
                  progressColor: Color.fromARGB(255, 0, 10, 144),
                  borderRadius: 20,
                  maxValue: 100,
                  currentValue: ravenclawPoints + 30,
                  verticalDirection: VerticalDirection.up,
                  direction: Axis.vertical,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                rpoints.toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "Ravenclaw",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 10, top: 10),
                child: Image.asset(
                  'assets/images/slytherin.png',
                  height: 64,
                ),
              ),
              Container(
                height: 200,
                child: FAProgressBar(
                  size: 40,
                  animatedDuration: Duration(milliseconds: 500),
                  borderColor: Colors.black,
                  backgroundColor: Colors.white,
                  borderWidth: 1,
                  progressColor: Color.fromARGB(255, 13, 98, 23),
                  borderRadius: 20,
                  maxValue: 100,
                  currentValue: slytherinPoints + 30,
                  verticalDirection: VerticalDirection.up,
                  direction: Axis.vertical,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                spoints.toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "Slytherin",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ]);
  }
}
