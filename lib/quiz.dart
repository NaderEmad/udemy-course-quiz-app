import 'package:flutter/material.dart';
import 'package:udemy_course_quiz_app/data/questions.dart';
import 'package:udemy_course_quiz_app/questions_screen.dart';
import 'package:udemy_course_quiz_app/results_screen.dart';
import 'package:udemy_course_quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'start-screen';
      selectedAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(chooseAnswer);
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(restartQuiz, selectedAnswers);
    }
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: screenWidget,
      ),
    );
  }
}
