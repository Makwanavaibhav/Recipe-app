import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/recipe.dart';
import '../providers/recipe_provider.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  bool _isLoading = false;
  RecipeDetails? _recipeDetails;

  @override
  void initState() {
    super.initState();
    _loadRecipeDetails();
  }

  Future<void> _loadRecipeDetails() async {
    setState(() {
      _isLoading = true;
    });

    final details = await context.read<RecipeProvider>().getRecipeDetails(
      widget.recipe.id,
    );

    setState(() {
      _recipeDetails = details;
      _isLoading = false;
    });
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Could not open link')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.title, style: const TextStyle(fontSize: 18)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recipe Image
            AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(
                imageUrl: widget.recipe.image,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Theme.of(context).colorScheme.surface,
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Theme.of(context).colorScheme.surface,
                  child: const Icon(Icons.restaurant, size: 50),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Recipe Title and Likes
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.recipe.title,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(Icons.favorite, color: Theme.of(context).colorScheme.primary),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.recipe.likes}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Used Ingredients
                  _buildIngredientSection(
                    'Used Ingredients',
                    widget.recipe.usedIngredients,
                    Colors.green,
                    Icons.check_circle,
                  ),

                  const SizedBox(height: 16),

                  // Missing Ingredients
                  if (widget.recipe.missedIngredients.isNotEmpty)
                    _buildIngredientSection(
                      'Missing Ingredients',
                      widget.recipe.missedIngredients,
                      Colors.orange,
                      Icons.warning,
                    ),

                  if (widget.recipe.missedIngredients.isNotEmpty)
                    const SizedBox(height: 16),

                  // Recipe Details
                  if (_isLoading)
                    const Center(child: CircularProgressIndicator())
                  else if (_recipeDetails != null)
                    _buildRecipeDetails(_recipeDetails!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIngredientSection(
    String title,
    List ingredients,
    Color color,
    IconData icon,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...ingredients.map((ingredient) {
          final name = ingredient.name;
          final amount = ingredient.amount;
          final unit = ingredient.unit;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '$amount $unit $name',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildRecipeDetails(RecipeDetails details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Recipe Info
        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildInfoItem(
                      'Servings',
                      '${details.servings}',
                      Icons.people,
                    ),
                    _buildInfoItem(
                      'Time',
                      '${details.readyInMinutes} min',
                      Icons.timer,
                    ),
                    _buildInfoItem(
                      'Health',
                      '${details.healthScore.toInt()}',
                      Icons.favorite,
                    ),
                  ],
                ),
                  const SizedBox(height: 12),
                if (details.diets.isNotEmpty) ...[
                  Text(
                    'Dietary Info:',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: details.diets.map((diet) {
                      return Chip(
                        label: Text(diet),
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.secondaryContainer,
                        labelStyle: const TextStyle(fontSize: 12),
                      );
                    }).toList(),
                  ),
                ],
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Instructions
        if (details.instructions.isNotEmpty) ...[
          Text(
            'Instructions',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(details.instructions, style: Theme.of(context).textTheme.bodyMedium),
            ),
          ),
        ],

        const SizedBox(height: 16),

        // Source Link
        if (details.sourceUrl.isNotEmpty) ...[
          Text(
            'Source',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.link),
              title: Text(
                details.sourceName.isNotEmpty
                    ? details.sourceName
                    : 'View Recipe',
              ),
              trailing: const Icon(Icons.open_in_new),
              onTap: () => _launchUrl(details.sourceUrl),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildInfoItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
