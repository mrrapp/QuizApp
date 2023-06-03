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
          'user_answer': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;
    return Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          // number of correct answers
          Text(
            'You got $numCorrectAnswers of $numTotalQuestions questions correctly',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 32,
              color: whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),

          // list of answers
          QuestionSummary(
            summaryData: summaryData,
          ),

          //Restart Button
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: whiteColor,
              textStyle: GoogleFonts.inter(
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
