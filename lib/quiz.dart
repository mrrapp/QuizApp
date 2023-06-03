import 'package:flutter/material.dart';
import 'package:fluuter_quizeapp/data/questions.dart';
import 'package:fluuter_quizeapp/questions_page.dart';
import 'package:fluuter_quizeapp/result_page.dart';
import 'package:fluuter_quizeapp/splash_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'splash_screen';

//
// creating an empty list to store answered questions
  List<String> selectedAnswers = [];
  // a function to switch screen with the start button
  void switchScreen() {
    setState(
      () {
        activeScreen = 'question_screen';
      },
    );
  }

  // creating a function that updates the answered question list
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    // making a condition that checks if all questions have been answered to sitch to answer page
    if (questions.length == selectedAnswers.length) {
      setState(
        () {
          selectedAnswers = [];
          activeScreen = 'result_screen';
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = SplashScreen(switchScreen);
    //Widget screenWidget is an alternative to the use of ternary conditional to switch screens

    if (activeScreen == 'question_screen')
      screenWidget = QuestionsPage(onSelectAnswer: chooseAnswer);

    if (activeScreen == 'result_screen') {
      screenWidget = ResultPage(
        chosenAnswers: selectedAnswers,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.bottomLeft,
              colors: [Colors.deepPurple, Colors.lightBlue],
            ),
          ),
          // conditional logic to switch screens
          child: screenWidget,
          // activeScreen == 'splash_screen'
          //     ? SplashScreen(switchScreen)
          //     : QuestionsPage(onSelectAnswer: chooseAnswer),
        ),
      ),
    );
  }
}
