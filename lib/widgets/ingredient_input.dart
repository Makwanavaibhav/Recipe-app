import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recipe_provider.dart';
import '../data/ingredients_data.dart';

class IngredientInput extends StatefulWidget {
  const IngredientInput({super.key});

  @override
  State<IngredientInput> createState() => _IngredientInputState();
}

class _IngredientInputState extends State<IngredientInput> {
  final TextEditingController _manualController = TextEditingController();
  final List<String> _ingredients = [];

  @override
  void dispose() {
    _manualController.dispose();
    super.dispose();
  }

  void _addIngredient() {
    final ingredient = _manualController.text.trim();
    if (ingredient.isNotEmpty && !_ingredients.contains(ingredient)) {
      setState(() {
        _ingredients.add(ingredient);
        _manualController.clear();
      });
    }
  }

  void _removeIngredient(String ingredient) {
    setState(() {
      _ingredients.remove(ingredient);
    });
  }

  void _searchRecipes() {
    if (_ingredients.isNotEmpty) {
      context.read<RecipeProvider>().findRecipesByIngredients(_ingredients);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Ingredients',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      final pattern = textEditingValue.text;
                      if (pattern.isEmpty) return const Iterable<String>.empty();
                      final suggestions = IngredientData.getSuggestions(pattern);
                      return suggestions.where((s) =>
                          !_ingredients
                              .any((i) => i.toLowerCase() == s.toLowerCase()));
                    },
                    fieldViewBuilder:
                        (context, fieldTextEditingController, focusNode, onFieldSubmitted) {
                      return TextField(
                        controller: _manualController,
                        focusNode: focusNode,
                        decoration: InputDecoration(
                          hintText: 'Enter an ingredient (e.g., chicken, rice)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          suffixIcon: const Icon(Icons.search),
                        ),
                        onSubmitted: (_) => _addIngredient(),
                      );
                    },
                    optionsViewBuilder: (context, onSelected, options) {
                      return Material(
                        elevation: 4,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          children: options.map((option) {
                            return ListTile(
                              leading: const Icon(Icons.restaurant),
                              title: Text(option),
                              onTap: () {
                                _manualController.text = option;
                                onSelected(option);
                                _addIngredient();
                              },
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: _addIngredient,
                  icon: const Icon(Icons.add),
                  style: IconButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
            ...(_ingredients.isNotEmpty
                ? [
                    const SizedBox(height: 12),
                    Text(
                      'Selected Ingredients:',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _ingredients.map((ingredient) {
                        return Chip(
                          label: Text(ingredient),
                          deleteIcon: const Icon(Icons.close, size: 18),
                          onDeleted: () => _removeIngredient(ingredient),
                          backgroundColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _searchRecipes,
                        icon: const Icon(Icons.search),
                        label: const Text('Find Recipes'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Theme.of(context).colorScheme.onPrimary,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                  ]
                : []),
          ],
        ),
      ),
    );
  }
}