import 'package:flutter/material.dart';
import 'package:fluuter_quizeapp/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
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
      ),
    );
  }
}
