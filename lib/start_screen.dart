import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/logos/quiz-logo.png',
              width: 200, color: Colors.white.withOpacity(0.75)),
          const SizedBox(
            height: 70,
          ),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(
            height: 70,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () {
              startQuiz();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.arrow_right_alt),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Start Quiz',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
