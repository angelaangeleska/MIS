class Recipe {
  int id;
  String mealName;
  String? mealAlternate;
  String mealCategory;
  String mealArea;
  String mealInstructions;
  String mealThumb;
  String? mealYoutubeLink;
  Map<String, String> ingredients;
  Map<String, String> measures;

  Recipe({
    required this.id,
    required this.mealName,
    this.mealAlternate,
    required this.mealCategory,
    required this.mealArea,
    required this.mealInstructions,
    required this.mealThumb,
    this.mealYoutubeLink,
    required this.ingredients,
    required this.measures,
  });

  factory Recipe.fromJSON(Map<String, dynamic> json) {
    Map<String, String> ingredients = {};
    Map<String, String> measures = {};
    for (int i = 1; i <= 20; i++) {
      final ingredientKey = 'strIngredient$i';
      final measureKey = 'strMeasure$i';
      final ingredient = json[ingredientKey];
      final measure = json[measureKey];
      if (ingredient != null && ingredient.toString().trim().isNotEmpty) {
        ingredients[ingredientKey] = ingredient.toString();
      }
      if (measure != null && measure.toString().trim().isNotEmpty) {
        measures[measureKey] = measure.toString();
      }
    }

    return Recipe(
      id: int.parse(json['idMeal']),
      mealName: json['strMeal'],
      mealAlternate: json['strMealAlternate'],
      mealCategory: json['strCategory'],
      mealArea: json['strArea'],
      mealInstructions: json['strInstructions'],
      mealThumb: json['strMealThumb'],
      mealYoutubeLink: json['strYoutube'],
      ingredients: ingredients,
      measures: measures,
    );
  }

  Map<String, dynamic> toJSON() {
    final data = <String, dynamic>{
      'idMeal': id.toString(),
      'strMeal': mealName,
      'strMealAlternate': mealAlternate,
      'strCategory': mealCategory,
      'strArea': mealArea,
      'strInstructions': mealInstructions,
      'strMealThumb': mealThumb,
      'strYoutube': mealYoutubeLink,
    };

    ingredients.forEach((key, value) {
      data[key] = value;
    });

    measures.forEach((key, value) {
      data[key] = value;
    });

    return data;
  }
}
