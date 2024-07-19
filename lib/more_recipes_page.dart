import 'package:flutter/material.dart';
import 'recipe_detail_page.dart';
import 'data/recipes_data.dart';

class MoreRecipesPage extends StatelessWidget {
  final String title;
  final List<RecipeDetail> recipes;
  final Function(RecipeDetail) toggleFavorite;
  final List<RecipeDetail> favoriteRecipes;

  MoreRecipesPage({
    required this.title,
    required this.recipes,
    required this.toggleFavorite,
    required this.favoriteRecipes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return RecipeCard(
              recipe: recipes[index],
              itemHeight: 250,
              toggleFavorite: toggleFavorite,
              isFavorite: favoriteRecipes.contains(recipes[index]),
            );
          },
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final RecipeDetail recipe;
  final double itemHeight;
  final Function(RecipeDetail) toggleFavorite;
  final bool isFavorite;

  RecipeCard({
    required this.recipe,
    required this.itemHeight,
    required this.toggleFavorite,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    recipe.imageUrl,
                    height: itemHeight - 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      toggleFavorite(recipe);
                    },
                    child: Icon(
                      Icons.favorite,
                      color: isFavorite ? Colors.red : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              recipe.title,
              style: TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              recipe.chef,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[700],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Icon(Icons.star, size: 14, color: Colors.orange),
                SizedBox(width: 5),
                Text(
                  recipe.rating.toString(),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
