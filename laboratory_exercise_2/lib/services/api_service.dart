import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:laboratory_exercise_2/models/category.dart' as category_model;

import '../models/meal.dart';
import '../models/recipe.dart';

class ApiService {
    Future<List<category_model.Category>> loadCategories() async {
      String uri = "https://www.themealdb.com/api/json/v1/1/categories.php";
      final url = Uri.parse(uri);
      final response = await http.get(url);

      if(response.statusCode == 200) {
        final Map data = jsonDecode(response.body);
        final List list = data['categories'];
        return list.map((element) => category_model.Category.fromJSON(element)).toList();
      } else {
        throw Exception("Failed to load categories!");
      }
    }

    Future<List<Meal>> loadMealsByCategory(String categoryName) async {
      String uri = "https://www.themealdb.com/api/json/v1/1/filter.php?c=$categoryName";
      final url = Uri.parse(uri);
      final response = await http.get(url);

      if(response.statusCode == 200) {
        final Map data = jsonDecode(response.body);
        final List list = data['meals'];
        return list.map((element) => Meal.fromJSON(element)).toList();
      } else {
        throw Exception("Failed to load meals!");
      }
    }

    Future<Recipe> loadRecipeByMealId(int mealId) async {
      String uri = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$mealId";
      final url = Uri.parse(uri);
      final response = await http.get(url);

      if(response.statusCode == 200) {
        final Map data = jsonDecode(response.body);
        final List list = data['meals'];
        return Recipe.fromJSON(list[0]);
      } else {
        throw Exception("Failed to load recipe!");
      }
    }

    Future<Recipe> loadRandomRecipe() async {
      String uri = "https://www.themealdb.com/api/json/v1/1/random.php";
      final url = Uri.parse(uri);
      final response = await http.get(url);

      if(response.statusCode == 200) {
        final Map data = jsonDecode(response.body);
        final List list = data['meals'];
        return Recipe.fromJSON(list[0]);
      } else {
        throw Exception("Failed to load random recipe!");
      }
    }

    Future<List<Meal>> searchMealsByName(String query) async {
      String uri = "https://www.themealdb.com/api/json/v1/1/search.php?s=$query";
      final url = Uri.parse(uri);
      final response = await http.get(url);

      if(response.statusCode == 200) {
        final Map data = jsonDecode(response.body);
        final List? list = data['meals'];
        if (list == null) return [];
        return list.map((element) => Meal.fromJSON(element)).toList();
      } else {
        throw Exception("Failed to search meals!");
      }
    }
}