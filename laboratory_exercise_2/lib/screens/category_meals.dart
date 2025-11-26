import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../services/api_service.dart';
import '../widgets/meal_grid.dart';

class CategoryMealsPage extends StatefulWidget {
  const CategoryMealsPage({super.key});

  @override
  State<StatefulWidget> createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  late String categoryName;
  List<Meal> _meals = [];
  List<Meal> _filteredMeals = [];
  bool _isLoading = true;
  String query = "";
  final TextEditingController _textEditingController = TextEditingController();
  final ApiService _apiService = ApiService();
  bool _initialized = false;

  @override
  Widget build(BuildContext context) {
    categoryName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("$categoryName meals"),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: "Search meals...",
                prefixIcon: Icon(Icons.search, color: Colors.deepOrange.shade400),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(color: Colors.deepOrange.shade400, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(color: Colors.deepOrange.shade700, width: 2),
                ),
                filled: true,
                fillColor: Colors.deepOrange.shade50,
              ),
              onChanged: (val) {
                setState(() {
                  query = val;
                  _filteredMeals = _meals
                      .where((m) => m.mealName.toLowerCase().contains(query.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: MealGrid(meals: _filteredMeals),
            ),
          )
        ],
      ),
    );
  }

  void _loadMeals() async {
    try {
      final mealsList = await _apiService.loadMealsByCategory(categoryName);
      setState(() {
        _meals = mealsList;
        _filteredMeals = mealsList;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      categoryName = ModalRoute.of(context)!.settings.arguments as String;
      _loadMeals();
      _initialized = true;
    }
  }
}
