import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  int questionIndex;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[questionIndex]),
        ...(questions[this.questionIndex]['answers']
                as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => this.answerQuestion(answer['score']), answer['text']);
        }).toList(),
      ],
    );
  }
}
