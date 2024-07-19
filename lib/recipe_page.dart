import 'package:flutter/material.dart';
import 'data/recipes_data.dart';

class RecipeDetailPage extends StatelessWidget {
  final RecipeDetail recipeDetail;

  RecipeDetailPage({required this.recipeDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeDetail.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                recipeDetail.imageUrl,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                recipeDetail.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'By ${recipeDetail.chef}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange),
                  Text(recipeDetail.rating.toString()),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                recipeDetail.description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Ingredients',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              for (var ingredient in recipeDetail.ingredients)
                Text(
                  '• $ingredient',
                  style: TextStyle(fontSize: 16),
                ),
              SizedBox(height: 16),
              Text(
                'Instructions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              for (var instruction in recipeDetail.instructions)
                Text(
                  instruction,
                  style: TextStyle(fontSize: 16),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
