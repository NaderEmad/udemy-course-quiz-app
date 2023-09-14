import 'package:flutter/material.dart';
import 'package:udemy_course_quiz_app/data/questions.dart';
import 'package:udemy_course_quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.restartQuiz, this.chosenAnswers, {super.key});

  final List<String> chosenAnswers;

  final void Function() restartQuiz;

  int correctAnswerNum() {
    int correctAnswerCounter = 0;
    for (int i = 0; i < questions.length; i++) {
      if (chosenAnswers[i] == questions[i].answers[0]) {
        correctAnswerCounter++;
      }
    }
    return correctAnswerCounter;
  }

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                  'You answered ${correctAnswerNum()} out of ${questions.length} questions correctly!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 24, color: Color.fromARGB(255, 225, 212, 255))),
              const SizedBox(height: 30),
              QuestionsSummary(getSummaryData()),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shadowColor: Colors.transparent,
                ),
                onPressed: restartQuiz,
                icon: const Icon(Icons.restart_alt, color: Colors.white),
                label: const Text(
                  'Restart Quiz!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
