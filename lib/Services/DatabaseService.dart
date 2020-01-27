import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wizzards/Models/User.dart';

class DatabaseService {
  final uid;
  DatabaseService({this.uid});
  final CollectionReference studentCollection =
      Firestore.instance.collection('students');

  Future updateUserData(
      String name, String email, String food, String house) async {
    return await studentCollection.document(uid).setData({
      'name': name,
      'email': email,
      'food': food,
      'house': house,
    });
  }

  Future updateHouseData(String house) async {
    return await studentCollection.document(uid).updateData({
      'house': house,
    });
  }

  List<UserData> _studentListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return UserData(
          name: doc.data['name'] ?? "",
          email: doc.data['email'] ?? "",
          food: doc.data['food'] ?? "",
          house: doc.data['house']);
    }).toList();
  }

  Stream<List<UserData>> get students {
    return studentCollection.snapshots().map(_studentListFromSnapshot);
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        name: snapshot.data['name'],
        email: snapshot.data['email'],
        food: snapshot.data['food'],
        house: snapshot.data['house']);
  }

  //get user doc
  Stream<UserData> get userData {
    return studentCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
