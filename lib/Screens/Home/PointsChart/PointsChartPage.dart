import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Screens/Home/PointsChart/PointsChart.dart';
import 'package:wizzards/Services/EventService.dart';
import 'package:wizzards/Models/Points.dart';

class PointsChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Points>.value(
      value: EventService().pointData,
      child: Container(
          padding: EdgeInsets.only(
            bottom: 50,
          ),
          decoration: BoxDecoration(
              color: Colors.black26,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20.0, // has the effect of softening the shadow
                  spreadRadius: 5.0, // has the effect of extending the shadow
                  offset: Offset(
                    10.0, // horizontal, move right 10
                    10.0, // vertical, move down 10
                  ),
                )
              ],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35))),
          child: PointsChart()),
    );
  }
}
