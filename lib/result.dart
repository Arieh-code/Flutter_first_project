import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are not a good professor!';
    } else if (resultScore <= 20) {
      resultText = 'Starting to get there!';
    } else if (resultScore <= 30) {
      resultText = 'Just a little better!';
    } else {
      resultText = 'Sabich all the way!';
    }
    return resultText;
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
          TextButton(
            onPressed: resetHandler,
            child: Text('Restart Quiz'),
            style: TextButton.styleFrom(foregroundColor: Colors.blue),
          )
        ],
      ),
    );
  }
}
