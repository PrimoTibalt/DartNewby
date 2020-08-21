import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function restart;
  Result(this.totalScore, this.restart);

  String get resultPhrase {
    return 'Congratulations!You earned $totalScore scores!';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(child: Text('Restart'), onPressed: this.restart)
      ],
    ));
  }
}
