import 'package:fitness_app/components/block_button.dart';
import 'package:fitness_app/models/ingredient.dart';
import 'package:fitness_app/repositories/ingredient_repository.dart';
import 'package:flutter/material.dart';

class IngredientPage extends StatefulWidget {
  final Ingredient ingredient;

  const IngredientPage({super.key, required this.ingredient});

  @override
  _IngredientPageState createState() => _IngredientPageState();
}

class _IngredientPageState extends State<IngredientPage> {
  final _form = GlobalKey<FormState>();
  late var nameController = TextEditingController(text: widget.ingredient.name);
  late var typeController = TextEditingController(text: widget.ingredient.type);
  late var caloriesController =
      TextEditingController(text: widget.ingredient.calories.toString());
  late IngredientRepository _ingredientRepository;

  @override
  void initState() {
    super.initState();
    _ingredientRepository = IngredientRepository();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes do ingrediente"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Form(
              key: _form,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nome é obrigatório';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: typeController,
                    decoration: const InputDecoration(labelText: 'Tipo'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tipo é obrigatório';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: caloriesController,
                    decoration: const InputDecoration(labelText: 'Calorias'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Calorias são obrigatórias';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            BlockButton(
              onPressed: () {
                if (_form.currentState!.validate()) {
                  final ingredient = Ingredient(
                    id: widget.ingredient.id,
                    name: nameController.text,
                    type: typeController.text,
                    calories: int.parse(caloriesController.text),
                  );

                  _ingredientRepository.updateIngredient(ingredient);
                  Navigator.of(context).pop(ingredient);
                }
              },
              label: "Salvar",
            ),
          ],
        ),
      ),
    );
  }
}
