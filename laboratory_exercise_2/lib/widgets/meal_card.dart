import 'package:flutter/material.dart';

import '../main.dart';
import '../models/meal.dart';

class MealCard extends StatefulWidget {
  final Meal meal;

  const MealCard({super.key, required this.meal});

  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  @override
  Widget build(BuildContext context) {
    final isFavourite = favourites[widget.meal.id] ?? false;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/meal", arguments: widget.meal.id);
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
                  child: Image.network(
                    widget.meal.mealThumb,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Divider(
                thickness: 1.2,
                color: Colors.deepOrange.shade400,
                height: 14,
              ),
              Text(
                widget.meal.mealName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepOrange.shade700,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    favourites[widget.meal.id] = !(isFavourite);
                  },
                  child: IconButton(
                    icon: Icon(
                      isFavourite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.deepOrange.shade700,
                    ),
                    onPressed: () {
                      setState(() {
                        favourites[widget.meal.id] = !isFavourite;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
