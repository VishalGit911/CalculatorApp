import 'package:flutter/material.dart';

Widget answerScreen(String answer) {
  return Expanded(
      child: Padding(
    padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      child: Center(
        child: Text(
          answer,
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
    ),
  ));
}
