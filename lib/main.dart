import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/colors.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  final List<Map<String, dynamic>> questions = [
    {
      'questionText': 'What\'s your favorite color ?',
      'answers': [
        {"text": 'green', 'score': 10},
        {"text": 'black', 'score': 12},
        {"text": 'blue', 'score': 23},
        {"text": 'red', 'score': 32},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal ?',
      'answers': [
        {'text': 'Elephant', 'score': 10},
        {'text': 'Cat', 'score': 30},
        {'text': 'Tiger', 'score': 10},
        {'text': 'Lion', 'score': 20},
      ]
    },
    {
      'questionText': 'What\'s your favorite instructor ?',
      'answers': [
        {'text': 'Ahmed', 'score': 3},
        {'text': 'Mohamed', 'score': 6},
        {'text': 'Rizk', 'score': 10},
        {'text': 'Mahmoud', 'score': 12},
      ]
    }
  ];

  int _totalScore = 0;
  bool isSwitched = false;

  void reset() {
    setState(() {
      _questionIndex = 0;
    });
    _totalScore = 0;
  }

  void func(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
          actions: [
            Switch(
              activeColor: Colors.tealAccent,
              inactiveThumbColor: Colors.white,
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    if (isSwitched == false) {
                      AppColors.primaryColor = Colors.white;
                      AppColors.secondaryColor = Colors.black;
                    } else {
                      AppColors.primaryColor = Colors.black;
                      AppColors.secondaryColor = Colors.white;
                    }
                  });
                })
          ],
        ),
        body: Container(
          color: AppColors.primaryColor,
          child: questions.length != _questionIndex
              ? Quiz(questions, _questionIndex, func)
              : Result(reset, _totalScore),
        ),
      ),
    );
  }
}
