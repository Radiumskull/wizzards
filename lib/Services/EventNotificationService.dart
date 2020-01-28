import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wizzards/Models/EventNotification.dart';

class EventNotificationService {
  final CollectionReference eventNotificationCollection =
      Firestore.instance.collection('eventNotification');
  //event notifications
  List<EventNotification> _eventNotificationListFromSnapshot(
      QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return EventNotification(
          eventHeadline: doc.data['eventHeadline'] ?? "",
          eventWinners: doc.data['eventWinners'] ?? "",
          eventDate: doc.data['eventDate'] ?? "");
    }).toList();
  }

  Stream<List<EventNotification>> get eventNotifications {
    return eventNotificationCollection
        .snapshots()
        .map(_eventNotificationListFromSnapshot);
  }
}
