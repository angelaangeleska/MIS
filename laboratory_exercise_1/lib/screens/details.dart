import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/exam.dart';

class ExamDetails extends StatelessWidget {
  const ExamDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final exam = ModalRoute.of(context)!.settings.arguments as Exam;
    final formattedDateTime = DateFormat(
      'dd/MM/yyyy HH:mm',
    ).format(exam.dateTime);
    final now = DateTime.now();
    final difference = exam.dateTime.difference(now);

    String remainingTimeText;
    IconData remainingIcon;
    Color remainingColor;

    if (difference.isNegative) {
      remainingTimeText = 'Exam passed ${difference.inDays.abs()} days ago';
      remainingIcon = Icons.check_circle_outline;
      remainingColor = Colors.red.shade400;
    } else if (difference.inDays > 0) {
      remainingTimeText = '${difference.inDays} days until exam';
      remainingIcon = Icons.timer_outlined;
      remainingColor = Colors.teal;
    } else if (difference.inHours > 0) {
      remainingTimeText = '${difference.inHours} hours until exam';
      remainingIcon = Icons.timer_outlined;
      remainingColor = Colors.deepOrange;
    } else if (difference.inMinutes > 0) {
      remainingTimeText = '${difference.inMinutes} minutes until exam';
      remainingIcon = Icons.timer_outlined;
      remainingColor = Colors.purple;
    } else {
      remainingTimeText = 'Exam starts soon!';
      remainingIcon = Icons.notifications_active_outlined;
      remainingColor = Colors.amber.shade700;
    }

    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: Text(
          exam.courseName.toUpperCase(),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 6,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined, color: Colors.teal,),
                    const SizedBox(width: 12),
                    Text(formattedDateTime, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  ],
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, color: Colors.blueGrey),
                    const SizedBox(width: 12),
                    Flexible(
                      child: Text(
                        exam.classrooms.join(", "),
                        style: const TextStyle(fontSize: 16),
                        softWrap: true,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Icon(remainingIcon, color: remainingColor),
                    const SizedBox(width: 12),
                    Text(
                      remainingTimeText,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: remainingColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
  
}