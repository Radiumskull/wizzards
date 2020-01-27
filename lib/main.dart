import 'package:flutter/material.dart';
import 'package:wizzards/Services/Auth.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Shared/SplashScreen.dart';
import 'package:wizzards/Shared/FirebaseNotificationHandler.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    new FirebaseNotifications().setUpFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wizzards',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Splash(),
      ),
    );
  }
}
