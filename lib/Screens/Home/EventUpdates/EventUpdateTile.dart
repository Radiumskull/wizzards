import 'package:flutter/material.dart';
import 'package:wizzards/Models/EventNotification.dart';

class EventUpdateTile extends StatelessWidget {
  EventUpdateTile({this.eventUpdate});
  final EventNotification eventUpdate;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
      elevation: 6,
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        title: Center(
          child: Text(
            eventUpdate.eventHeadline,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(eventUpdate.eventDate),
              SizedBox(
                height: 5,
              ),
              Text("Winners",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black)),
              ...eventUpdate.eventWinners.split(",").map((name) {
                Color color;
                if (name.split("(")[1] == "Hufflepuff)") {
                  color = Color.fromARGB(255, 255, 157, 10);
                }
                return Text(name,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: color));
              }),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
