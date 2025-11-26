import 'package:flutter/material.dart';
import 'package:laboratory_exercise_2/services/api_service.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/recipe.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  int? mealId;
  late Recipe recipe;
  bool _isLoading = true;
  final ApiService _apiService = ApiService();
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      final args = ModalRoute.of(context)!.settings.arguments;

      if (args is int) {
        mealId = args;
        _loadRecipe();
      } else {
        _loadRandomRecipe();
      }

      _initialized = true;
    }
  }

  void _loadRandomRecipe() async {
    final recipeData = await _apiService.loadRandomRecipe();
    setState(() {
      recipe = recipeData;
      _isLoading = false;
    });
  }

  void _loadRecipe() async {
    final recipeData = await _apiService.loadRecipeByMealId(mealId!);
    setState(() {
      recipe = recipeData;
      _isLoading = false;
    });
  }

  Widget _buildIngredients() {
    List<Widget> ingredientWidgets = [];
    recipe.ingredients.forEach((key, ingredient) {
      final measureKey = key.replaceAll('Ingredient', 'Measure');
      final measure = recipe.measures[measureKey] ?? '';
      if (ingredient.isNotEmpty) {
        ingredientWidgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              '• $ingredient - $measure',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade900),
            ),
          ),
        );
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ingredientWidgets,
    );
  }

  Future<void> _launchYoutubeLink() async {
    final String? raw = recipe.mealYoutubeLink;

    if (raw == null || raw.trim().isEmpty) {
      return;
    }

    String youtubeUrl = raw.trim();

    final uri = Uri.parse(youtubeUrl);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_isLoading ? 'Loading...' : recipe.mealName),
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(recipe.mealThumb),
            ),
            const SizedBox(height: 20),
            Text(
              recipe.mealName,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              recipe.mealInstructions,
              style: theme.textTheme.bodyLarge?.copyWith(height: 1.4),
            ),
            const SizedBox(height: 20),
            Text(
              'Ingredients',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 12),
            _buildIngredients(),
            const SizedBox(height: 24),
            if (recipe.mealYoutubeLink != null &&
                recipe.mealYoutubeLink!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _launchYoutubeLink,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.play_circle_fill),
                      label: const Text(
                        'Watch YouTube tutorial',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
