class Category {
  int id;
  String categoryName;
  String categoryThumb;
  String categoryDescription;

  Category({
    required this.id,
    required this.categoryName,
    required this.categoryThumb,
    required this.categoryDescription
  });

  Category.fromJSON(Map<String, dynamic> data) :
        id = int.parse(data['idCategory']),
        categoryName = data['strCategory'],
        categoryThumb = data['strCategoryThumb'],
        categoryDescription = data['strCategoryDescription'];

  Map<String, dynamic> toJSON() => {
    'idCategory': id.toString(),
    'strCategory': categoryName,
    'strCategoryThumb': categoryThumb,
    'strCategoryDescription': categoryDescription,
  };
}