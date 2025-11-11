import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final formattedDateTime = DateFormat(
      'dd/MM/yyyy HH:mm',
    ).format(exam.dateTime);

    final now = DateTime.now();
    final isPast = exam.dateTime.isBefore(now);
    final cardBackgroundColor = isPast ? Colors.red.shade100 : Colors.teal.shade100;
    final courseNameColor = isPast ? Colors.red.shade700 : Colors.teal.shade900;
    final color = isPast ? Colors.red.shade400 : Colors.teal.shade400;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/details", arguments: exam);
      },
      child: Card.filled(
        color: cardBackgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: color, width: 5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(exam.courseName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: courseNameColor)),
              Divider(),
              SizedBox(height: 2),
              Row(
                children: [
                  Icon(Icons.calendar_today_rounded, color: color, size: 20),
                  SizedBox(width: 8),
                  Text(formattedDateTime, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.location_on, color: color, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(exam.classrooms.join(", "), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
