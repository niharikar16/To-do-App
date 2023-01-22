import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyButtons extends StatelessWidget {

  final String text;
  VoidCallback onPressed;

  MyButtons(
      {Key? key,
        required this.text,
        required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
    color: Color(0x80B09E99),
    child: Center(child: Text(text, style: GoogleFonts.josefinSans(),)),);
  }
}
