import 'package:ezpop/ui/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task? task;
  const TaskTile(this.task);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: getBGClr(task?.color??0),
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task?.title??"",
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                Text(
                  task?.note??"",
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 0.5,
            color: Colors.grey[200]!.withOpacity(0.7),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              task!.isCompleted ==1 ? "COMPLETED" : "TODO",
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              ),
            ),
          )
        ],),
      ),
    );
  }

  getBGClr(int no) {
    switch (no) {
      case 0:
      return purpleClr;
      case 1:
        return tealClr;
      case 2:
        return pinkClr;
      default:
        return purpleClr;
    }
  }
}
