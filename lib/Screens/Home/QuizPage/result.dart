import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Models/User.dart';
import 'package:wizzards/Services/DatabaseService.dart';

class Result extends StatelessWidget {
  int resultscoreg;
  int resultscorer;
  int resultscores;
  int resultscoreh;
  String finalHouse = "";
  int finalHouseCount = 0;
  void updateHouse(String house, BuildContext context) async {
    try {
      final user = Provider.of<User>(context);
      await DatabaseService(uid: user.uid).updateHouseData(house);
    } catch (e) {
      print(e.toString());
    }
  }

  List<int> initCounts(BuildContext context) {
    final students = Provider.of<List<UserData>>(context);
    if (students != null) {
      List<int> houseCounts = [0, 0, 0, 0];
      for (int index = 0; index < students.length; index++) {
        if (students[index].house == 'gryffindor') {
          houseCounts[0] += 1;
        } else if (students[index].house == 'hufflepuff') {
          houseCounts[1] += 1;
        } else if (students[index].house == 'ravenclaw') {
          houseCounts[2] += 1;
        } else if (students[index].house == 'slytherin') {
          houseCounts[3] += 1;
        }
      }
      print(houseCounts);
      return houseCounts;
    } else {
      return null;
    }
  }

  void allotHouse(BuildContext context) async {
    List<int> houseCounts = initCounts(context);
    if (houseCounts != null) {
      if (resultscoreg > resultscorer &&
          resultscoreg > resultscoreh &&
          resultscoreg > resultscores) {
        if (houseCounts[0] < 15) {
          finalHouse = "Gryffindor";
          return;
        } else {
          resultscoreg = 0;
        }
      }
      if (resultscorer > resultscoreg &&
          resultscorer > resultscoreh &&
          resultscorer > resultscores) {
        if (houseCounts[2] < 15) {
          finalHouse = "Ravenclaw";
          return;
        } else {
          resultscorer = 0;
        }
      }
      if (resultscoreh > resultscoreg &&
          resultscoreh > resultscorer &&
          resultscoreh > resultscores) {
        if (houseCounts[1] < 15) {
          finalHouse = "Hufflepuff";
          return;
        } else {
          resultscoreh = 0;
        }
      } else {
        finalHouse = "Slytherin";
      }
    }
  }

  Result(this.resultscoreg, this.resultscorer, this.resultscores,
      this.resultscoreh);

  @override
  Widget build(BuildContext context) {
    allotHouse(context);
    updateHouse(finalHouse.toLowerCase(), context);
    Color bgColor;
    if (finalHouse == "Gryffindor") {
      bgColor = Color.fromARGB(255, 102, 0, 0);
    } else if (finalHouse == "Hufflepuff") {
      bgColor = Color.fromARGB(255, 255, 157, 10);
    } else if (finalHouse == "Slytherin") {
      bgColor = Color.fromARGB(255, 46, 117, 28);
    } else if (finalHouse == "Ravenclaw") {
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
              finalHouse == ""
                  ? SizedBox(
                      height: 1,
                    )
                  : Image.asset(
                      'assets/images/${finalHouse.toLowerCase()}.png'),
              Text(
                finalHouse,
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

// Future calc() async {
//   if (resultscoreg > resultscorer &&
//       resultscoreg > resultscoreh &&
//       resultscoreg > resultscores)
//     return "Gryffindor";
//   else if (resultscorer > resultscoreg &&
//       resultscorer > resultscoreh &&
//       resultscorer > resultscores)
//     return "Ravenclaw";
//   else if (resultscoreh > resultscoreg &&
//       resultscoreh > resultscorer &&
//       resultscoreh > resultscores)
//     return "Hufflepuff";
//   else
//     return "Slytherin";
// }
