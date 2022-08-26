import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/questions.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final _questionIndex;
  final Function(int score) func;
  Quiz(this.questions, this._questionIndex,this.func);
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Question(questions[_questionIndex]['questionText']),
          ...questions[_questionIndex]['answers'].map((item) {
            return Answer(item['text'], func,item['score']);
          }).toList()
        ],
      ),
    );
  }
}
