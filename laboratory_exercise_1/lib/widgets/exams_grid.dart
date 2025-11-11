import 'package:flutter/cupertino.dart';
import 'package:laboratory_exercise_1/models/exam.dart';

import 'exam_card.dart';

class ExamsGrid extends StatefulWidget {
  final List<Exam> exams;

  const ExamsGrid({super.key, required this.exams});

  @override
  State<StatefulWidget> createState() {
    return _ExamsGridState();
  }
}

class _ExamsGridState extends State<ExamsGrid> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1 , mainAxisSpacing: 4, childAspectRatio: 2),
      itemCount: widget.exams.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ExamCard(exam: widget.exams[index]);
      },
    );
  }
}