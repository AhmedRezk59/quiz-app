import 'package:flutter/material.dart';
import 'package:quiz_app/colors.dart';

class Result extends StatelessWidget {
  final Function() reset;

  final int _totalScore;

  const Result(this.reset, this._totalScore);
  String get resultPhrase {
    String string = '';
    if (_totalScore > 50) {
      string = 'You are awesome';
    } else if (_totalScore > 30) {
      string = 'You are good';
    } else {
      string = 'You are bad';
    }
    return string += '! Your score is $_totalScore';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(resultPhrase,style: TextStyle(fontSize: 24 , color: AppColors.secondaryColor),),
          TextButton(onPressed: reset, child: Text('Repeat!',style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }
}
