import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function handler;
  final String answer;
  Answer(this.handler, this.answer);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      height: 100,
      child: GestureDetector(
        onTap: handler,
        child: Card(
          color: Colors.grey,
          child: Center(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                answer,
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
