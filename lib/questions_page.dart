import 'package:flutter/material.dart';
import 'package:fluuter_quizeapp/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/questions.dart';
import 'answer_button.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({
    super.key,
    required this.onSelectAnswer,
  });
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

var currentQuestionIndex = 0;

class _QuestionsPageState extends State<QuestionsPage> {
  var currentQuestionIndex = 0;
  //
  // creating answer function
  void answerQuestion(String selectedAnswer) {
    // passing the onSelect function
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      // making an increament to question index by 1
      currentQuestionIndex++;
    });
  }

  //
  @override
  Widget build(BuildContext context) {
    // assigning current question variable which will be rebuilt after each answered question
    final currentQuestion = questions[currentQuestionIndex];
    return SafeArea(
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentQuestion.question,
                textAlign: TextAlign.center,
                style: GoogleFonts.lora(
                    fontSize: 28,
                    color: whiteColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30.0,
              ),
              // my first use of a "spread" with maps
              // .map() function changes cluttered list to individual list
              ...currentQuestion.getShuffledAnswers().map(
                    (answer) => AnswerButton(
                        //item is equivalent to answer
                        answer: answer,
                        onTap: () {
                          answerQuestion(answer);
                        }),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
