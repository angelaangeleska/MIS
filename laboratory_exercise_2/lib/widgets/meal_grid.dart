import 'package:flutter/cupertino.dart';
import 'package:laboratory_exercise_2/models/meal.dart';

import 'meal_card.dart';

class MealGrid extends StatefulWidget {
  final List<Meal> meals;

  const MealGrid({super.key, required this.meals});

  @override
  State createState() => _MealGrid();
}

class _MealGrid extends State<MealGrid> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.meals.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          return MealCard(meal: widget.meals[index]);
        }
    );
  }

}