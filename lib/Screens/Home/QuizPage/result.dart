import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultscoreg;
  final int resultscorer;
  final int resultscores;
  final int resultscoreh;

  String calc() {
    if (resultscoreg > resultscorer &&
        resultscoreg > resultscoreh &&
        resultscoreg > resultscores)
      return "Gryffindor";
    else if (resultscorer > resultscoreg &&
        resultscorer > resultscoreh &&
        resultscorer > resultscores)
      return "Ravenclaw";
    else if (resultscoreh > resultscoreg &&
        resultscoreh > resultscorer &&
        resultscoreh > resultscores)
      return "Hufflepuff";
    else
      return "Slytherin";
  }

  Result(this.resultscoreg, this.resultscorer, this.resultscores,
      this.resultscoreh);

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    if (calc() == "Gryffindor") {
      bgColor = Color.fromARGB(255, 102, 0, 0);
    } else if (calc() == "Hufflepuff") {
      bgColor = Color.fromARGB(255, 255, 157, 10);
    } else if (calc() == "Slytherin") {
      bgColor = Color.fromARGB(255, 46, 117, 28);
    } else if (calc() == "Ravenclaw") {
      bgColor = Color.fromARGB(255, 25, 57, 86);
    } else {
      bgColor = Colors.white;
    }
    return Container(
      color: bgColor,
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset('assets/images/${calc().toLowerCase()}.png'),
              Text(
                calc(),
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "You Finished the Quiz",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ]),
      ),
    );
  }
}
