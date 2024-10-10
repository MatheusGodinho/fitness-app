import 'package:fitness_app/models/ingredient.dart';
import 'package:flutter/material.dart';

class IngredientRepository extends ChangeNotifier {
  final List<Ingredient> _ingredients = [];

  List<Ingredient> get ingredients => _ingredients;

  IngredientRepository() {
    _initRepository();
  }

  _initRepository() {
    _ingredients
        .add(Ingredient(id: 1, name: 'Banana', type: 'Fruta', calories: 89));
    _ingredients
        .add(Ingredient(id: 2, name: 'Maçã', type: 'Fruta', calories: 52));
    _ingredients
        .add(Ingredient(id: 3, name: 'Laranja', type: 'Fruta', calories: 47));
    _ingredients
        .add(Ingredient(id: 4, name: 'Pera', type: 'Fruta', calories: 57));
    _ingredients
        .add(Ingredient(id: 5, name: 'Uva', type: 'Fruta', calories: 69));
    _ingredients
        .add(Ingredient(id: 6, name: 'Carne', type: 'Proteína', calories: 200));
    _ingredients.add(
        Ingredient(id: 7, name: 'Frango', type: 'Proteína', calories: 150));
    _ingredients
        .add(Ingredient(id: 8, name: 'Peixe', type: 'Proteína', calories: 100));
    notifyListeners();
  }

  void addIngredient(Ingredient ingredient) {
    _ingredients.add(ingredient);
    notifyListeners();
  }

  void removeIngredient(Ingredient ingredient) {
    _ingredients.remove(ingredient);
    notifyListeners();
  }

  void updateIngredient(Ingredient ingredient) {
    final index = _ingredients.indexWhere((i) => i.id == ingredient.id);
    _ingredients[index] = ingredient;
    notifyListeners();
  }
}
