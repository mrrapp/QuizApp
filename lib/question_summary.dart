import 'package:flutter/material.dart';



class QuestionSummary extends StatelessWidget {
  const QuestionSummary({
    super.key,
    required this.summaryData,
  });
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return Column(
      // the summary data used below is already a list hence [] not used
      children: summaryData
          .map(
            (data) => Row(
              children: [
                Text(((data['questions_index'] as int) + 1).toString()),
                Column(
                  children: [
                    Text(data['questions'] as String),
                    SizedBox(
                      height: 5,
                    ),
                    Text(data['user_answer'] as String),
                    Text(data['correct_answer'] as String),
                  ],
                )
              ],
            ),
          )
          .toList(),
    );
  }
}
