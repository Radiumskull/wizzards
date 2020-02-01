import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:wizzards/Models/User.dart';
import 'package:wizzards/Services/DatabaseService.dart';

import './quiz.dart';
import './result.dart';

class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizPageState();
  }
}

class _QuizPageState extends State<QuizPage> {
  var _questionindex = 0;
  var _totalscoreg = 0;
  var _totalscorer = 0;
  var _totalscores = 0;
  var _totalscoreh = 0;

  void _ansq(
    int scoreg,
    int scorer,
    int scores,
    int scoreh,
  ) {
    _totalscoreg += scoreg;
    _totalscorer += scorer;
    _totalscores += scores;
    _totalscoreh += scoreh;
    setState(() {
      _questionindex++; //property changed
    });
  }

  var _questionanswer = [
    {
      'questiontext':
          "You and two friends need to cross a bridge guarded by a river troll who insists on fighting one of you before he will let all of you pass. Do you:",
      "answertext": [
        {
          "text":
              "Attempt to confuse the troll into letting all three of you pass without fighting?",
          "scoreg": 20,
          "scorer": 44,
          "scoreh": 18,
          "scores": 23,
        },
        {
          "text": "Suggest drawing lots to decide which of you will fight?",
          "scoreg": 16,
          "scorer": 17,
          "scoreh": 47,
          "scores": 17,
        },
        {
          "text":
              "Suggest that all three of you should fight (without telling the troll)?’",
          "scoreg": 18,
          "scorer": 19,
          "scoreh": 16,
          "scores": 42,
        },
        {
          "text": "Volunteer to fight?",
          "scoreg": 46,
          "scorer": 19,
          "scoreh": 19,
          "scores": 18,
        },
      ],
    },
    {
      'questiontext': "Dawn or dusk?",
      "answertext": [
        {
          "text": "Dawn",
          "scoreg": 73,
          "scorer": 73,
          "scoreh": 30,
          "scores": 26,
        },
        {
          "text": "Dusk?",
          "scoreg": 27,
          "scorer": 27,
          "scoreh": 70,
          "scores": 74,
        },
      ],
    },
    {
      'questiontext': "Forest or river?",
      "answertext": [
        {
          "text": "Forest",
          "scoreg": 77,
          "scorer": 73,
          "scoreh": 26,
          "scores": 28,
        },
        {
          "text": "River",
          "scoreg": 26,
          "scorer": 27,
          "scoreh": 74,
          "scores": 72,
        }
      ],
    },
    {
      'questiontext': "Moon or Stars?",
      "answertext": [
        {
          "text": "Moon",
          "scoreg": 27,
          "scorer": 74,
          "scoreh": 26,
          "scores": 28,
        },
        {
          "text": "Stars",
          "scoreg": 73,
          "scorer": 26,
          "scoreh": 67,
          "scores": 28,
        },
      ],
    },
    {
      'questiontext': "Black or White?",
      "answertext": [
        {
          "text": "Black",
          "scoreg": 73,
          "scorer": 29,
          "scoreh": 24,
          "scores": 72,
        },
        {
          "text": "White",
          "scoreg": 27,
          "scorer": 71,
          "scoreh": 76,
          "scores": 28,
        },
      ],
    },
    {
      'questiontext': "Which would you rather be:",
      "answertext": [
        {
          "text": "Envied?",
          "scoreg": 10,
          "scorer": 24,
          "scoreh": 10,
          "scores": 24,
        },
        {
          "text": "Praised?",
          "scoreg": 24,
          "scorer": 11,
          "scoreh": 11,
          "scores": 19,
        },
        {
          "text": "Liked?",
          "scoreg": 15,
          "scorer": 11,
          "scoreh": 29,
          "scores": 10,
        },
      ],
    },
    {
      'questiontext': "What are you most looking forward to learning at Hogwarts?",
      "answertext": [
        {
          "text": "Flying on a broomstick",
          "scoreg": 19,
          "scorer": 7,
          "scoreh": 18,
          "scores": 9,
        },
        {
          "text": "Secrets about the castle",
          "scoreg": 24,
          "scorer": 13,
          "scoreh": 11,
          "scores": 9,
        },
        {
          "text": "Every area of magic I can",
          "scoreg": 11,
          "scorer": 27,
          "scoreh": 11,
          "scores": 10,
        },
      ],
    },
    {
      'questiontext': "Heads or Tails?",
      "answertext": [
        {
          "text": "Heads",
          "scoreg": 27,
          "scorer": 69,
          "scoreh": 74,
          "scores": 27,
        },
        {
          "text": "Tails",
          "scoreg": 73,
          "scorer": 31,
          "scoreh": 26,
          "scores": 74,
        },
      ],
    },
    {
      'questiontext': "Heads or Tails?",
      "answertext": [
        {
          "text": "Heads",
          "scoreg": 27,
          "scorer": 69,
          "scoreh": 74,
          "scores": 27,
        },
        {
          "text": "Tails",
          "scoreg": 73,
          "scorer": 31,
          "scoreh": 26,
          "scores": 74,
        },
      ],
    },
    {
      'questiontext': "If you could have any power, which would you choose?",
      "answertext": [
        {
          "text": "The power to read minds",
          "scoreg": 10,
          "scorer": 22,
          "scoreh": 10,
          "scores": 22,
        },
        {
          "text": "The power of invisibility",
          "scoreg": 33,
          "scorer": 10,
          "scoreh": 14,
          "scores": 13,
        },
        {
          "text": "The power to change the past",
          "scoreg": 18,
          "scorer": 13,
          "scoreh": 14,
          "scores": 28,
        },
        {
          "text": "The power to change your appearance at will",
          "scoreg": 15,
          "scorer": 28,
          "scoreh": 14,
          "scores": 10,
        },
      ],
    },
    {
      'questiontext':
          "Four boxes are placed before you. Which would you try and open?",
      "answertext": [
        {
          "text":
              "The small tortoiseshell box, embellished with gold, inside which some small creature seems to be squeaking.",
          "scoreg": 14,
          "scorer": 18,
          "scoreh": 46,
          "scores": 18,
        },
        {
          "text":
              "The gleaming jet black box with a silver lock and key, marked with a mysterious rune that you know to be the mark of Merlin.",
          "scoreg": 18,
          "scorer": 20,
          "scoreh": 16,
          "scores": 46,
        },
        {
          "text":
              "The small pewter box, unassuming and plain, with a scratched message upon it that reads ‘I open only for the worthy.’",
          "scoreg": 49,
          "scorer": 19,
          "scoreh": 17,
          "scores": 17,
        },
        {
          "text":
              "The ornate golden casket, standing on clawed feet, whose inscription warns that both secret knowledge and unbearable temptation lie within",
          "scoreg": 19,
          "scorer": 44,
          "scoreh": 21,
          "scores": 19,
        },
      ],
    },
    {
      'questiontext':
          "One of your house mates has cheated in a Hogwarts exam by using a Self-Spelling Quill. Now he has come top of the class in Charms, beating you into second place. Professor Flitwick is suspicious of what happened. He draws you to one side after his lesson and asks you whether or not your classmate used a forbidden quill. What do you do?",
      "answertext": [
        {
          "text":
              "Lie and say you don’t know (but hope that somebody else tells Professor Flitwick the truth).",
          "scoreg": 17,
          "scorer": 14,
          "scoreh": 43,
          "scores": 18,
        },
        {
          "text":
              "Tell Professor Flitwick that he ought to ask your classmate (and resolve to tell your classmate that if he doesn’t tell the truth, you will).",
          "scoreg": 43,
          "scorer": 16,
          "scoreh": 22,
          "scores": 14,
        },
        {
          "text":
              "Tell Professor Flitwick the truth. If your classmate is prepared to win by cheating, he deserves to be found out. Also, as you are both in the same house, any points he loses will be regained by you, for coming first in his place.’",
          "scoreg": 22,
          "scorer": 45,
          "scoreh": 16,
          "scores": 19,
        },
        {
          "text":
              "You would not wait to be asked to tell Professor Flitwick the truth. If you knew that somebody was using a forbidden quill, you would tell the teacher before the exam started.",
          "scoreg": 19,
          "scorer": 24,
          "scoreh": 19,
          "scores": 49,
        },
      ],
    },
    {
      'questiontext': "What kind of instrument most pleases your ear?",
      "answertext": [
        {
          "text": "The trumpet.",
          "scoreg": 17,
          "scorer": 14,
          "scoreh": 43,
          "scores": 18,
        },
        {
          "text": "The drum",
          "scoreg": 43,
          "scorer": 16,
          "scoreh": 22,
          "scores": 14,
        },
        {
          "text": "The piano",
          "scoreg": 22,
          "scorer": 45,
          "scoreh": 16,
          "scores": 19,
        },
        {
          "text": "The violin",
          "scoreg": 19,
          "scorer": 24,
          "scoreh": 19,
          "scores": 49,
        },
      ],
    },
    {
      'questiontext': "What trait you doesn't associate yourself with?",
      "answertext": [
        {
          "text": "Selfish.",
          "scoreg": 17,
          "scorer": 14,
          "scoreh": 43,
          "scores": 18,
        },
        {
          "text": "Cowardly",
          "scoreg": 43,
          "scorer": 16,
          "scoreh": 22,
          "scores": 14,
        },
        {
          "text": "Ignorant",
          "scoreg": 22,
          "scorer": 45,
          "scoreh": 16,
          "scores": 19,
        },
        {
          "text": "Ordinary",
          "scoreg": 19,
          "scorer": 24,
          "scoreh": 19,
          "scores": 49,
        },
      ],
    },
    {
      'questiontext': "How would you like to be known to history?",
      "answertext": [
        {
          "text": "The Bold",
          "scoreg": 17,
          "scorer": 14,
          "scoreh": 43,
          "scores": 18,
        },
        {
          "text": "Cowardly",
          "scoreg": 43,
          "scorer": 16,
          "scoreh": 22,
          "scores": 14,
        },
        {
          "text": "The Wise",
          "scoreg": 22,
          "scorer": 45,
          "scoreh": 16,
          "scores": 19,
        },
        {
          "text": "The Great",
          "scoreg": 19,
          "scorer": 24,
          "scoreh": 19,
          "scores": 49,
        },
      ],
    },
  ];

  Widget build(BuildContext context) {
    return StreamProvider<List<UserData>>.value(
      value: DatabaseService().students,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.arrow_back_ios),
          backgroundColor: Color.fromARGB(255, 27, 38, 44),
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text(
            " Back ",
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: _questionindex < _questionanswer.length
            ? ListView(children: <Widget>[
                Quiz(
                    questionanswer: _questionanswer,
                    questionindex: _questionindex,
                    ansq: _ansq)
              ])
            : Result(_totalscoreg, _totalscorer, _totalscores, _totalscoreh),
      ),
    );
  }
}
