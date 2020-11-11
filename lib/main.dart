import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 5},
        {'text': 'Monkey', 'score': 3},
        {'text': 'Rabbit', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Mauve', 'score': 10},
        {'text': 'Lavender', 'score': 3},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favourite hobby?',
      'answers': [
        {'text': 'Coding', 'score': 10},
        {'text': 'Sleeping', 'score': 5},
        {'text': 'Eating', 'score': 8},
        {'text': 'Dreaming', 'score': 1}
      ],
    },
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
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('we have more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mini Quiz'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
