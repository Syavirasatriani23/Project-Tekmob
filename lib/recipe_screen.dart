import 'package:flutter/material.dart';
import 'package:nutridish/recipe_detail_page.dart';
import 'data/recipes_data.dart';

class RecipeScreen extends StatelessWidget {
  final Function(RecipeDetail) toggleFavorite;
  final List<RecipeDetail> favoriteRecipes;

  RecipeScreen({required this.toggleFavorite, required this.favoriteRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            final isFavorite = favoriteRecipes.contains(recipe);
            return ListTile(
              leading: Image.asset(recipe.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(recipe.title),
              subtitle: Text('By ${recipe.chef}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, size: 14, color: Colors.orange),
                  SizedBox(width: 5),
                  Text(recipe.rating.toString(), style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailPage(
                      recipeDetail: recipe,
                      toggleFavorite: toggleFavorite,
                      isFavorite: isFavorite,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
