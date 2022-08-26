import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;

  final Function(int score) func;
  
  final int score;

  const Answer(this.answerText, this.func , this.score);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      child: ElevatedButton(
        child: Text(
          answerText,
          style: const TextStyle(fontSize: 25),
        ),
        onPressed: () => func(this.score) ,
      ),
    );
  }
}
