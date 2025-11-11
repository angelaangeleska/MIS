import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final int numOfExams;

  const Badge({super.key, required this.numOfExams});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: 50,
      child: Container(
        height: 50,
        color: Colors.teal.shade200,
        alignment: Alignment.center,
        child: Text("Total exams: $numOfExams", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, color: Colors.black),),
      ),
    );
  }}