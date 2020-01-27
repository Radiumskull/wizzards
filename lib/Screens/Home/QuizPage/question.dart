import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  @override
  Question(this.questions);
  final String questions;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.only(bottom: 60),
      child: Text(
        questions,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
