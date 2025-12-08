import 'package:flutter/material.dart';
import 'package:laboratory_exercise_2/main.dart';

import '../models/meal.dart';
import '../services/api_service.dart';
import '../widgets/meal_grid.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  final ApiService _apiService = ApiService();
  List<Meal> _favouriteMeals = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavouriteMeals();
  }

  Future<void> _loadFavouriteMeals() async {
    final categories = await _apiService.loadCategories();
    final List<Meal> allMeals = [];

    var category;
    for (category in categories) {
      final meals = await _apiService.loadMealsByCategory(
        category.categoryName,
      );
      allMeals.addAll(meals);
    }

    final favs = allMeals.where((m) => favourites[m.id] == true).toList();

    setState(() {
      _favouriteMeals = favs;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final favCount = _favouriteMeals.length;

    return Scaffold(
      appBar: AppBar(
        title: Text("Favourites ($favCount)"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : MealGrid(meals: _favouriteMeals)
    );
  }
}
