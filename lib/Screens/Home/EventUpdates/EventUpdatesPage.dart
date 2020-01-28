import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Models/EventNotification.dart';
import 'package:wizzards/Screens/Home/EventUpdates/EventUpdateList.dart';
import 'package:wizzards/Services/EventNotificationService.dart';

class EventUpdatesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<EventNotification>>.value(
      value: EventNotificationService().eventNotifications,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.arrow_back_ios),
          backgroundColor: Color.fromARGB(255, 27, 38, 44),
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text(
            " Back ",
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          color: Colors.black12,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "Event",
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      letterSpacing: 6),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Notifications",
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      letterSpacing: 6),
                ),
              ),
              EventUpdateList(),
            ],
          ),
        ),
      ),
    );
  }
}
