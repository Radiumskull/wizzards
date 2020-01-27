import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Models/Event.dart';
import 'package:wizzards/Screens/Home/EventInformation/EventTile.dart';

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<List<Event>>(context);
    if (events == null) {
      return Container();
    } else {
      return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              "Events",
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  letterSpacing: 12),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            reverse: true,
            itemCount: events.length - 1,
            itemBuilder: (context, index) {
              return EventTile(index: index, event: events[index]);
            },
          )
        ],
      );
    }
  }
}
