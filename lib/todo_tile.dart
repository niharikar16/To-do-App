import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoList extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunc;

  //functionality of any tile
  ToDoList(
      {Key? key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunc})
      : super(key: key);
  final bool _isElevated = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunc,
            borderRadius: BorderRadius.circular(12),
            icon: Icons.delete_forever,
            backgroundColor: Color(0xFFFF6961),)
          ],
        ),
        child: Container(
          //neomorphism
          decoration: BoxDecoration(
              color: Color(0xFFFAE4D9),
              borderRadius: BorderRadius.circular(18),
              boxShadow: _isElevated
                  ? [
                //background shadow, buttom one is grey, offset is cordinate of shadow
                BoxShadow(
                    color: Color(0xFFB09E99),
                    offset: const Offset(10, 7),
                    blurRadius: 15,
                    spreadRadius: 1),
                //backgrounf shadow, top is white
                // ignore: prefer_const_constructors
                BoxShadow(
                    color: Color(0xFFFAE4D9),
                    offset: const Offset(-4, -4),
                    blurRadius:30,
                    spreadRadius: 1)
              ]
                  : null),



          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              //check box
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Color(0xFFB09E99),
              ),

              //task name
              Text(
                taskName,
                style: GoogleFonts.josefinSans(
                    fontSize: 20,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
