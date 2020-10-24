import 'package:flutter/material.dart';
import 'package:quizeer/constants.dart';
import 'package:quizeer/quizpage.dart';

void main() {
  runApp(Quizeer());
}

class Quizeer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "The Quiz Master",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: kGradient,
            ),
          ),
        ),
        body: SafeArea(
            child: QuizPage(),
        ),
      ),
    );
  }
}
