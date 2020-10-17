import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'constants.dart';
import 'quize_logic.dart';

QuizLogic quizLogic = new QuizLogic();

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int totalCorrect = 0;
  int totalQuestion = 0;
  String crct = "VERDICT";

  void checkAnswer(bool value) {
    if (quizLogic.getAnswer() == value) {
      crct = "CORRECT ANSWER";
      totalCorrect += 10;
    } else {
      crct = "WRONG ANSWER";
    }
    totalQuestion++;
    if (quizLogic.isFinished() == true) {
      Alert(
          context: context,
          title: "Finished",
          desc: "You scored $totalCorrect",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Play Again",
                style: TextStyle(
                  color: txtColr,
                  fontSize: 20,
                ),
              ),
            )
          ]).show();
      quizLogic.reSet();
      totalCorrect = 0;
      totalQuestion = 0;
    } else {
      quizLogic.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: SizedBox(
                  height: 50,
                  width: 150,
                ),
              ),
              Container(
                height: 50,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: pColr,
                ),
                child: Center(
                  child: Text(
                    "SCORE: $totalCorrect",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: txtColr,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: pColr,
              ),
              child: Center(
                child: Text(
                  quizLogic.getQuestion(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: txtColr,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5.8),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    textColor: txtColr,
                    color: trueCard,
                    child: Text(
                      "TRUE",
                      style: TextStyle(
                        color: txtColr,
                        fontSize: 35.0,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        checkAnswer(true);
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5.8),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    textColor: txtColr,
                    color: falseCard,
                    child: Text(
                      "FALSE",
                      style: TextStyle(
                        color: txtColr,
                        fontSize: 35.0,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        checkAnswer(false);
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: pColr,
                ),
                child: Center(
                  child: Text(
                    "$crct",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: txtColr,
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: falseCard,
                ),
                child: FlatButton(
                  child: Text(
                    "Reset",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: txtColr,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      quizLogic.reSet();
                      totalCorrect = 0;
                      totalQuestion = 0;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
