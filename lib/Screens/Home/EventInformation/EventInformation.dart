import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Models/Event.dart';
import 'package:wizzards/Services/EventService.dart';
import 'package:wizzards/Screens/Home/EventInformation/EventList.dart';

class EventInformation extends StatefulWidget {
  @override
  _EventInformationState createState() => _EventInformationState();
}

class _EventInformationState extends State<EventInformation> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Event>>.value(
      value: EventService().events,
      child: Container(
        child: Column(
          children: <Widget>[
            EventList(),
          ],
        ),
      ),
    );
  }
}
