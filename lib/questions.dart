import 'package:flutter/material.dart';
import 'package:quiz_app/colors.dart';

class Question extends StatelessWidget {
  final String question;

  const Question(this.question);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        child: Text(
          question,
          style: TextStyle(fontSize: 30 , color: AppColors.secondaryColor),
          textAlign: TextAlign.center,
        ));
  }
}
