class Meal {
  int id;
  String mealName;
  String mealThumb;

  Meal({
    required this.id,
    required this.mealName,
    required this.mealThumb,
  });

  Meal.fromJSON(Map<String, dynamic> data) :
        id = int.parse(data['idMeal']),
        mealName = data['strMeal'],
        mealThumb = data['strMealThumb'];

  Map<String, dynamic> toJSON() => {
    'idMeal': id.toString(),
    'strMeal': mealName,
    'strMealThumb': mealThumb,
  };
}