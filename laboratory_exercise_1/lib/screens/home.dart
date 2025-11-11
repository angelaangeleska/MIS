import 'package:flutter/material.dart';

import '../models/exam.dart';
import '../widgets/exams_grid.dart';
import '../widgets/badge.dart' as custom_badge;

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Exam> _exams = [
    Exam(courseName: "Mobile Information Systems", dateTime: DateTime.now().add(const Duration(days: 3, hours: 2)), classrooms: ["Lab 12", "Lab 13", "Lab 200AB", "117 TMF"]),
    Exam(courseName: "Natural language processing", dateTime: DateTime.now().add(const Duration(days: 5, hours: 5)), classrooms: ["Lab 12"]),
    Exam(courseName: "Mobile platforms and programming", dateTime: DateTime.now().add(const Duration(days: 0, hours: 3)), classrooms: ["Lab 13"]),
    Exam(courseName: "Video games programming", dateTime: DateTime.now().add(const Duration(days: 0, hours: 1)), classrooms: ["Lab 2", "Lab 3", "TMF 138"]),
    Exam(courseName: "Implementation of Free and Open Source Systems", dateTime: DateTime.now().add(const Duration(days: 7, hours: 0)), classrooms: ["117 TMF", "Lab 215"]),
    Exam(courseName: "Web Based Systems", dateTime: DateTime.now().add(const Duration(days: 6, hours: 4)), classrooms: ["TMF 315", "TMF 215", "Lab 12", "Lab 13", "Lab 2", "Lab 3"]),
    Exam(courseName: "Software for embedded systems", dateTime: DateTime.now().add(const Duration(days: 2, hours: 2)), classrooms: ["Lab 315", "TMF 138"]),
    Exam(courseName: "Mining Massive Data Sets", dateTime: DateTime.now().add(const Duration(days: 3, hours: 1)), classrooms: ["Lab 200AB"]),
    Exam(courseName: "IoT", dateTime: DateTime.now().add(const Duration(days: 1, hours: 5)), classrooms: ["Lab 200AB"]),
    Exam(courseName: "Introduction to Smart Cities", dateTime: DateTime.now().add(const Duration(days: 5, hours: 3)), classrooms: ["Lab 3"]),
    Exam(courseName: "Introduction to Bioinformatics", dateTime: DateTime.now().add(const Duration(days: 4, hours: 1)), classrooms: ["Lab 12"]),
    Exam(courseName: "Database administration", dateTime: DateTime.now().subtract(const Duration(days: 1, hours: 1)), classrooms: ["Lab 2"]),
    Exam(courseName: "Advanced Human Computer Interaction", dateTime: DateTime.now().subtract(const Duration(days: 2, hours: 2)), classrooms: ["TMF 138", "117 TMF"]),
    Exam(courseName: "Autonomous robotics", dateTime: DateTime.now().subtract(const Duration(days: 1, hours: 3)), classrooms: ["Lab 13", "Lab 12"]),
    Exam(courseName: "Cloud computing", dateTime: DateTime.now().subtract(const Duration(days: 3, hours: 2)), classrooms: ["Lab 12"]),
  ];

  @override
  void initState() {
    super.initState();
    _exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          ExamsGrid(exams: _exams),
          custom_badge.Badge(numOfExams: _exams.length)
        ]
      ),
    );
  }
}