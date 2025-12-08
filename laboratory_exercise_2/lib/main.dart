import 'package:flutter/material.dart';
import 'package:laboratory_exercise_2/screens/category_meals.dart';
import 'package:laboratory_exercise_2/screens/favourites.dart';
import 'package:laboratory_exercise_2/screens/home.dart';
import 'package:laboratory_exercise_2/screens/meal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Map<int, bool> favourites = {};

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/category": (context) => const CategoryMealsPage(),
        "/meal": (context) => const MealPage(),
        "/favorites": (context) => const FavouritesPage(),
      },
    );
  }
}
