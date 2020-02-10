import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:wizzards/Models/User.dart';
import 'package:wizzards/Services/DatabaseService.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      return (_userFromFirebaseUser(user));



    } catch (e) {
      PlatformException error = e;
      return(error.message.toString());
      
    }
  }

  Future registerWithEmailAndPassword(String name, String email,
      String password, String food,String point, String house) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid)
          .updateUserData(name, email, food,point,house);
      return (_userFromFirebaseUser(user));
    } catch (e) {
      PlatformException error = e;
      return(error.message.toString());
    }
  }


  Future<void> resetPassword(String email) async {
    try{
      await _auth.sendPasswordResetEmail(email: email);
    } catch(e){
      print(e.toString());
      return null;
    }
}
}
