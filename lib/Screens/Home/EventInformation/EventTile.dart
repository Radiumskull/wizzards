import 'package:flutter/material.dart';
import 'package:wizzards/Models/Event.dart';

class EventTile extends StatelessWidget {
  final Event event;
  final int index;

  EventTile({this.index, this.event});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0)),
        child: ListTile(
            contentPadding: EdgeInsets.all(20),
            title: Center(
              child: Text(
                event.eventHeadline,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            subtitle: Column(
              children: <Widget>[
                Text(
                  event.eventDetails,
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Start Data : ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      event.startDate,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    Text(
                      "          End Data : ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      event.endDate,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
