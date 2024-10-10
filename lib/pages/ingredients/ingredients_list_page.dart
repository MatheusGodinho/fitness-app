import 'package:fitness_app/models/ingredient.dart';
import 'package:fitness_app/pages/ingredients/ingredient_list.dart';
import 'package:fitness_app/repositories/ingredient_repository.dart';
import 'package:flutter/material.dart';

class IngredientsListPage extends StatefulWidget {
  const IngredientsListPage({super.key});

  @override
  _IngredientsListPageState createState() => _IngredientsListPageState();
}

class _IngredientsListPageState extends State<IngredientsListPage> {
  late IngredientRepository _ingredientRepository;

  @override
  void initState() {
    super.initState();
    _ingredientRepository = IngredientRepository();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, _) => [
                const SliverAppBar(
                  title: Text('Ingredientes Base'),
                  floating: true,
                  snap: true,
                )
              ],
          body: IngredientList(ingredients: _ingredientRepository.ingredients)),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => setState(() {
                _ingredientRepository.addIngredient(
                  Ingredient(
                      id: _ingredientRepository.ingredients.length + 1,
                      name: 'Arroz',
                      type: 'Carboidrato',
                      calories: 80),
                );
              })),
    );
  }
}
