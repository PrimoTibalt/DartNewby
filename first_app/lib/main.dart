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
  var _questionIndex = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 30},
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 2},
        {'text': 'White', 'score': 100}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Snake', 'score': 10},
        {'text': 'Elephant', 'score': 50},
        {'text': 'Lion', 'score': 100}
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Max', 'score': 10},
        {'text': 'Max', 'score': 10},
        {'text': 'Max', 'score': 10}
      ]
    }
  ];

  var totalScore = 0;

  void _answerQuestion(int score) {
    totalScore += score;
    setState(() {
      this._questionIndex++;
    });
  }

  void _reset() {
    totalScore = 0;
    setState(() {
      this._questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My first application'),
            backgroundColor: Color.fromARGB(200, 100, 200, 110),
          ),
          body: this._questionIndex >= this._questions.length
              ? Result(this.totalScore, this._reset)
              : Quiz(
                  answerQuestion: this._answerQuestion,
                  questionIndex: this._questionIndex,
                  questions: this._questions,
                )),
      title: 'My default App',
    );
  }
}
