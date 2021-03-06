import 'questions.dart';

class QuizLogic {
  int _questionNum = 0;

  List<Question> _questions = [
    Question('Brasilia is the capital of Brazil', true),
    Question("The Indian Ocean is the third largest ocean in the world", true),
    Question('The city of Utrecht is in Holland', false),
    Question('There are more countries in Africa than Asia', true),
    Question('Seattle is more northerly than New York', true),
    Question('Rhode Island has a greater population than Mongolia', false),
    Question('The island of Borneo is occupied by three countries', true),
    Question('Mount Kilimanjaro is higher than Denali', false),
    Question('The Maldives has the lowest high point of any country', true),
    Question('Japan jas the world\'s highest life expectancy', false),
    Question('The world\'s tallest waterfall is in Venezuela', true),
    Question('The currency of Switzerland is the Euro', false),
    Question('China borders the same number of countries as Russia', true),
    Question('Shanghai has a greater population then Beijing', true),
  ];

  String getQuestion() {
    return _questions[_questionNum].questionStr;
  }

  bool isFinished() {
    if (_questionNum >= _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void printQuestionNumber() {
    print(_questionNum);
  }

  void printQuestionsLength() {
    print(_questions.length);
  }

  void reSet() {
    _questionNum = 0;
  }

  bool getAnswer() {
    return _questions[_questionNum].answer;
  }

  void nextQuestion() {
    if (_questionNum < _questions.length - 1) {
      _questionNum++;
    }
  }
}
