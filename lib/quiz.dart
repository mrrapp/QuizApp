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
  var activeScreen = 'splash_screen'; // an alternative to the above

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
      // I initially didn't use setstate, so I was not redirected to the next page
      setState(
        () {
          selectedAnswers = [];
          //  selectedAnswers =[]; // This clears the list in memory but is not working
          activeScreen = 'splash_screen'; // The page is now switched
          print('The length of list is ${selectedAnswers.length}');
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = SplashScreen(
        switchScreen); //inittially forgot this passed wchich caused error after aswering all questions

    if (activeScreen == 'question_screen') {
      screenWidget = QuestionsPage(onSelectAnswer: chooseAnswer);
    }
// Navigating to result page
    // if (activeScreen == 'result_screen') {
    //   screenWidget = ResultPage();
    // }
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
          child: activeScreen == 'splash_screen'
              ? SplashScreen(switchScreen)
              : QuestionsPage(onSelectAnswer: chooseAnswer),
        ),
      ),
    );
  }
}
