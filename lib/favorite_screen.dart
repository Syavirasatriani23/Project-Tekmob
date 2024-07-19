import 'package:flutter/material.dart';
import 'data/recipes_data.dart';
import 'recipe_detail_page.dart';

class FavoriteScreen extends StatelessWidget {
  final List<RecipeDetail> favoriteRecipes;

  FavoriteScreen({required this.favoriteRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: favoriteRecipes.isEmpty
          ? Center(child: Text('No favorite recipes yet.'))
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                final recipe = favoriteRecipes[index];
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
                          toggleFavorite: (RecipeDetail recipe) {},
                          isFavorite: true,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
