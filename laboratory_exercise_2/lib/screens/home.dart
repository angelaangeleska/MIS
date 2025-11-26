import 'package:flutter/material.dart';
import 'package:laboratory_exercise_2/models/category.dart';
import 'package:laboratory_exercise_2/services/api_service.dart';
import 'package:laboratory_exercise_2/widgets/category_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> _categories = [];
  bool _isLoading = true;
  String query = "";
  final TextEditingController _textEditingController = TextEditingController();
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    final filteredCategories = (query.isEmpty)
        ? _categories
        : _categories
        .where((c) => c.categoryName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Categories"),
        actions: [
          TextButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, "/meal", arguments: null);
          },
          icon: const Icon(Icons.local_dining, color: Colors.white),
            label: const Text("Recipe of the day", style: TextStyle(color: Colors.white)),
          ),
        ],
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
                hintText: "Search categories...",
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
                });
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: CategoryList(categories: filteredCategories),
            ),
          ),
        ],
      ),
    );
  }

  void _loadCategories() async {
    try {
      final categoriesList = await _apiService.loadCategories();
      setState(() {
        _categories = categoriesList;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
