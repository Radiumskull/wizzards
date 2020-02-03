import 'package:flutter/material.dart';
import 'package:wizzards/Screens/Home/QuizPage/question.dart';
import 'package:wizzards/Screens/Home/QuizPage/answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questionanswer;
  final int questionindex;
  final Function ansq;

  Quiz({this.questionanswer, this.questionindex, this.ansq});

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questionanswer[questionindex]['questiontext']),
        ...(questionanswer[questionindex]['answertext']
                as List<Map<String, Object>>)
            .map((ans) {
          return Answer(
              () => ansq(
                    ans["scoreg"],
                    ans["scorer"],
                    ans["scores"],
                    ans["scoreh"],
                  ),
              ans["text"]);
        }).toList(),
        SizedBox(
          height: 80,
        ),
      ],
    );
  }
}
