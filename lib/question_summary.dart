import 'package:flutter/material.dart';
import 'package:fluuter_quizeapp/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({
    super.key,
    required this.summaryData,
  });
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // the summary data used below is already a list hence [] not used
          children: summaryData
              .map(
                (data) => Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            color: whiteColor,
                            fontWeight: FontWeight.w400),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['questions'] as String,
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    color: whiteColor,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 5),
                              Text(
                                data['user_answer'] as String,
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    color: whiteColor,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                data['correct_answer'] as String,
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    color: whiteColor,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
