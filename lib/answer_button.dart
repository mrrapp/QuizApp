import 'package:flutter/material.dart';
import 'package:fluuter_quizeapp/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer, required this.onTap});
  final String answer;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              backgroundColor: const Color.fromARGB(255, 8, 63, 109)),
          child: Text(answer,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: whiteColor))),
    );
  }
}
