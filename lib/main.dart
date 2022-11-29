import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'QuestionText': 'Who is your favorite?',
      'Answers': [
        {'text': 'Arieh', 'score': 10},
        {'text': 'Matanel', 'score': 7},
        {'text': 'Adiel', 'score': 7},
        {'text': 'Sabich', 'score': 15}
      ]
    },
    {
      'QuestionText': 'What\'s going to be our score in the seminar?',
      'Answers': [
        {'text': '100', 'score': 10},
        {'text': '90', 'score': 7},
        {'text': '80', 'score': 5},
        {'text': '<=60', 'score': 0}
      ]
    },
    {
      'QuestionText': 'What\'s going to be our result in the final project?',
      'Answers': [
        {'text': '100', 'score': 10},
        {'text': '90', 'score': 7},
        {'text': '80', 'score': 5},
        {'text': '<=60>', 'score': 0}
      ]
    },
    {
      'QuestionText': 'How much are we going to see the app for?',
      'Answers': [
        {'text': '100 Mil', 'score': 5},
        {'text': '613 Mil', 'score': 8},
        {'text': '1Bil', 'score': 10},
        {'text': '18 Shekel', 'score': 0}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(_questions, _answerQuestion, _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
