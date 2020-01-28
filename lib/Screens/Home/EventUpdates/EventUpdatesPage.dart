import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Models/ColorPallete.dart';
import 'package:wizzards/Models/EventNotification.dart';
import 'package:wizzards/Screens/Home/EventUpdates/EventUpdateList.dart';
import 'package:wizzards/Services/EventNotificationService.dart';

class EventUpdatesPage extends StatelessWidget {
  final ColorPallete colorPallete;
  EventUpdatesPage(this.colorPallete);

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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: colorPallete.secondaryColor,
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 40),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: colorPallete.primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        )),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          child: Text(
                            "Event",
                            style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.w900,
                                color: colorPallete.textColor,
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
                                color: colorPallete.textColor,
                                letterSpacing: 6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  EventUpdateList(),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
