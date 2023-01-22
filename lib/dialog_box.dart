import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({Key? key,
    required this.controller,
  required this.onSave,
  required this.onCancel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFFB09E99),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

          TextField(
            style: GoogleFonts.josefinSans(),
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.black)),
            hintText: "Add a new task!", ),
          ),

          //buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButtons(text: "Save", onPressed: onSave),
              const SizedBox(width:10,),
              MyButtons(text: "Cancel", onPressed: onCancel)
            ],
          )
        ],),
      ),

    );
  }
}
