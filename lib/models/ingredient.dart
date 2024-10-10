class Ingredient {
  final int id;
  final String name;
  final String type;
  final int calories;

  Ingredient(
      {required this.id,
      required this.name,
      required this.type,
      this.calories = 0});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      name: json['name'],
      type: json['quantity'],
      calories: json['measure'],
    );
  }
}
