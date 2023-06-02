import 'package:flutter/material.dart';
import 'package:fluuter_quizeapp/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen(this.startQuiz, {super.key});
  final void Function()? startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Logo image
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200.00,
            color: const Color.fromARGB(170, 255, 255, 255),
          ),

          //Learn flutter the fun way
          const Padding(
            padding: EdgeInsets.only(top: 80.0, bottom: 30),
            child: Text(
              'Learn flutter the fun way!',
              style: TextStyle(fontSize: 28, color: whiteColor),
            ),
          ),

          // Start quiz button
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: whiteColor),
            icon: const Icon(Icons.arrow_forward_sharp),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
