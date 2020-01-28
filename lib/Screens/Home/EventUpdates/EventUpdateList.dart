import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Models/EventNotification.dart';
import 'package:wizzards/Screens/Home/EventUpdates/EventUpdateTile.dart';

class EventUpdateList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventUpdates = Provider.of<List<EventNotification>>(context);
    if (eventUpdates != null) {
      return Column(children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: eventUpdates.length,
          itemBuilder: (context, index) {
            return EventUpdateTile(eventUpdate: eventUpdates[index]);
          },
        )
      ]);
    } else {
      return Container();
    }
  }
}
