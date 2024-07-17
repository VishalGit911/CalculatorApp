import 'package:calculator/answerScreen.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String answer = "";
  String second = "";
  String first = "";
  int delet = 0;
  String opr = "";



  String arror = "Can't Divide by Zero";

  int cal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CALCULATOR",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            answerScreen(answer),
            Row(
              children: [
                numberButton("7"),
                numberButton("8"),
                numberButton("9"),
                opertorButton("+")
              ],
            ),
            Row(
              children: [
                numberButton("4"),
                numberButton("5"),
                numberButton("6"),
                opertorButton("-")
              ],
            ),
            Row(
              children: [
                numberButton("1"),
                numberButton("2"),
                numberButton("3"),
                opertorButton("*")
              ],
            ),
            Row(
              children: [
                numberButton("0"),
                numberButton("00"),
                numberButton("."),
                opertorButton("/")
              ],
            ),
            Row(
              children: [
                opertorButton("AC"),
                opertorButton("X"),
                opertorButton("=")
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget numberButton(String number) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              answer = "$answer$number";
            });
          },
          backgroundColor: Colors.grey,
          child: Text(
            number,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget opertorButton(String number) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: FloatingActionButton(
          backgroundColor: Colors.yellow.shade900,
          child: Text(
            number,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          onPressed: () {
            setState(() {
              if (number == "AC") {
                answer = "";
              }

              if (number == "+") {
                first = answer;
                answer = "";

                cal = 1;
              } else if (number == "-") {
                first = answer;
                answer = "";
                cal = 2;
              } else if (number == "*") {
                first = answer;
                answer = "";

                cal = 3;
              } else if (number == "/") {
                first = answer;
                answer = "";

                cal = 4;
              } else if (number == "X") {
                answer = answer.substring(0, answer.length - 1);
              }

              if (number == "=") {
                second = answer;
                answer = "";

                int c = 0;
                int a = int.parse(first);
                int b = int.parse(second);

                if (cal == 1) {
                  c = a + b;
                  answer = c.toString();
                } else if (cal == 2) {
                  c = a - b;
                  answer = c.toString();
                } else if (cal == 3) {
                  c = a * b;
                  answer = c.toString();
                } else if (cal == 4) {
                  if (second == "0") {
                    answer = arror;
                  } else {
                    c = a ~/ b;
                    answer = c.toString();
                  }
                }
              }
            });
          },
        ),
      ),
    );
  }
}
