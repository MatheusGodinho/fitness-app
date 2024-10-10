import 'package:fitness_app/models/ingredient.dart';
import 'package:fitness_app/pages/ingredients/ingredient_page.dart';
import 'package:flutter/material.dart';

class IngredientList extends StatelessWidget {
  final List<Ingredient> ingredients;

  const IngredientList({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          IngredientTile(ingredient: ingredients[index]),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: ingredients.length,
    );
  }
}

class IngredientTile extends StatelessWidget {
  const IngredientTile({
    super.key,
    required this.ingredient,
  });

  final Ingredient ingredient;

  void navigateToIngredientDetail(context, Ingredient ingredient) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => IngredientPage(ingredient: ingredient),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(ingredient.name),
      subtitle: Text(ingredient.type),
      trailing: Text('${ingredient.calories} cal'),
      onTap: () => navigateToIngredientDetail(context, ingredient),
    );
  }
}
