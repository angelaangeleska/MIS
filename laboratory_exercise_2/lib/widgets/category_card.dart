import 'package:flutter/material.dart';
import 'package:laboratory_exercise_2/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/category", arguments: category.categoryName);
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.deepOrange.shade400, width: 3),
          borderRadius: BorderRadius.circular(15),
        ),
        shadowColor: Colors.deepOrange.shade400,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 110,
                  child: Image.network(category.categoryThumb, fit: BoxFit.cover),
                ),
              ),
              Divider(
                color: Colors.deepOrange.shade400,
                thickness: 1.5,
                height: 16,
              ),
              Text(
                category.categoryName,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.deepOrange.shade700),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 6),
              Text(
                category.categoryDescription,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
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