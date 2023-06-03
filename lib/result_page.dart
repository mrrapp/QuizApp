import 'package:flutter/material.dart';
import 'package:fluuter_quizeapp/colors.dart';
import 'package:fluuter_quizeapp/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'question_summary.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;
// the getSummary will collect answers to questions
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++,) {
      summary.add(
        {
          'question_index': i,
          'questions': questions[i].question,
          'correct_answer': questions[i].answer[0],
          'user_answer':chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        child: Column(children: [
          // number of correct answers
          Text(
            'Total Correct answers',
            style: GoogleFonts.lato(
              fontSize: 32,
            ),
          ),

          // list of answers
         QuestionSummary(summaryData: getSummaryData()),

          //Restart Button
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: whiteColor,
              textStyle: TextStyle(
                color: whiteColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            child: Text('Restart Quiz Now!'),
          )
        ]),
      ),
    );
  }
}
