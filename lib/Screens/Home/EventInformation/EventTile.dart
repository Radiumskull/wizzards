import 'package:flutter/material.dart';
import 'package:wizzards/Models/Event.dart';

class EventTile extends StatelessWidget {
  final Event event;
  final int index;

  EventTile({this.index, this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  Text(event.eventDetails),
                  Text(
                      "Start Date : ${event.startDate} End Date : ${event.endDate}"),
                ],
              )),
        );
  }
}
