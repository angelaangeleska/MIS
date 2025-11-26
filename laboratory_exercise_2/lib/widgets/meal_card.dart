  import 'package:flutter/material.dart';

  import '../models/meal.dart';

  class MealCard extends StatelessWidget {
    final Meal meal;

    const MealCard({super.key, required this.meal});

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/meal", arguments: meal.id);
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.deepOrange.shade400, width: 3),
            borderRadius: BorderRadius.circular(12),
          ),
          shadowColor: Colors.deepOrange.shade300,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    height: 110,
                    child: Image.network(meal.mealThumb, fit: BoxFit.cover),
                  ),
                ),
                Divider(
                  thickness: 1.2,
                  color: Colors.deepOrange.shade400,
                  height: 14,
                ),
                Text(
                  meal.mealName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.deepOrange.shade700),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    }


  }