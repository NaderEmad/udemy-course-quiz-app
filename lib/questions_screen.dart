import 'package:flutter/material.dart';
import 'package:udemy_course_quiz_app/answer_button.dart';
import 'package:udemy_course_quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectedAnswer, {super.key});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int ind = 0;

  void changeQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      ind++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[ind];

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
                currentQuestion.question,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              ...currentQuestion.getShuffledAnswers().map((answer) {
                return AnswerButton(answer, () {
                  changeQuestion(answer);
                });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
