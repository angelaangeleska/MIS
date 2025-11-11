import 'package:flutter/material.dart';
import 'package:laboratory_exercise_1/screens/details.dart';
import 'package:laboratory_exercise_1/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Schedule',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal.shade200),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(title: "Exam Schedule - 221083"),
        "/details": (context) => const ExamDetails(),
      },
    );
  }
}