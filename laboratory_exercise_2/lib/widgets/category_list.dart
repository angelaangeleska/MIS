import 'package:flutter/cupertino.dart';
import 'package:laboratory_exercise_2/models/category.dart';

import 'category_card.dart';

class CategoryList extends StatefulWidget {
  final List<Category> categories;

  const CategoryList({super.key, required this.categories});

  @override
  State createState() => _CategoryList();
}

class _CategoryList extends State<CategoryList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.categories.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return CategoryCard(category: widget.categories[index]);
        }
    );
  }
}