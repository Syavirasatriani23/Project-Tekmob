import 'package:flutter/material.dart';
import 'recipe_detail_page.dart';
import 'data/recipes_data.dart';
import 'more_recipes_page.dart'; // Import halaman untuk melihat lebih banyak resep
import 'favorite_screen.dart'; // Import halaman Favorite
import 'recipe_screen.dart'; // Import halaman RecipeScreen
import 'notification_screen.dart'; // Import halaman NotificationScreen
import 'account_screen.dart'; // Import halaman AccountScreen

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  List<RecipeDetail> _filteredRecipes = [];
  List<RecipeDetail> _favoriteRecipes = []; // Daftar resep favorit
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _filteredRecipes = recipes;
    _searchController.addListener(() {
      _filterRecipes(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterRecipes(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredRecipes = recipes;
      });
    } else {
      setState(() {
        _filteredRecipes = recipes
            .where((recipe) =>
                recipe.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  void _toggleFavorite(RecipeDetail recipe) {
    setState(() {
      if (_favoriteRecipes.contains(recipe)) {
        _favoriteRecipes.remove(recipe);
      } else {
        _favoriteRecipes.add(recipe);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomeScreen(
        filteredRecipes: _filteredRecipes,
        toggleFavorite: _toggleFavorite,
        favoriteRecipes: _favoriteRecipes,
        searchController: _searchController,
      ),
      RecipeScreen(
        toggleFavorite: _toggleFavorite,
        favoriteRecipes: _favoriteRecipes,
      ),
      FavoriteScreen(favoriteRecipes: _favoriteRecipes), // Pass favoriteRecipes
      NotificationScreen(),
      AccountScreen(),
    ];

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Recipe',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<RecipeDetail> filteredRecipes;
  final Function(RecipeDetail) toggleFavorite;
  final List<RecipeDetail> favoriteRecipes;
  final TextEditingController searchController;

  HomeScreen({
    required this.filteredRecipes,
    required this.toggleFavorite,
    required this.favoriteRecipes,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'Welcome Back, ',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'NutFriend',
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.orange),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'What do you want to cook today?',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search Recipe',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.filter_list),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Category',
              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryChip(label: 'All', selected: true),
                  CategoryChip(label: 'Breakfast'),
                  CategoryChip(label: 'Brunch'),
                  CategoryChip(label: 'Dinner'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Recently Added',
              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            RecipeList(
              recipes: filteredRecipes.take(5).toList(),
              itemHeight: 250,
              toggleFavorite: toggleFavorite,
              favoriteRecipes: favoriteRecipes,
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoreRecipesPage(
                        title: 'Recently Added',
                        recipes: filteredRecipes,
                        toggleFavorite: toggleFavorite,
                        favoriteRecipes: favoriteRecipes,
                      ),
                    ),
                  );
                },
                child: Text('Lihat Selanjutnya'),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Most Loved',
              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            RecipeList(
              recipes: filteredRecipes.take(5).toList(),
              itemHeight: 250,
              toggleFavorite: toggleFavorite,
              favoriteRecipes: favoriteRecipes,
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoreRecipesPage(
                        title: 'Most Loved',
                        recipes: filteredRecipes,
                        toggleFavorite: toggleFavorite,
                        favoriteRecipes: favoriteRecipes,
                      ),
                    ),
                  );
                },
                child: Text('Lihat Selanjutnya'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;

  CategoryChip({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        label: Text(label),
        backgroundColor: selected ? Colors.orange : Colors.grey[200],
        labelStyle: TextStyle(color: selected ? Colors.white : Colors.black),
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  final List<RecipeDetail> recipes;
  final double itemHeight;
  final Function(RecipeDetail) toggleFavorite;
  final List<RecipeDetail> favoriteRecipes;

  RecipeList({required this.recipes, required this.itemHeight, required this.toggleFavorite, required this.favoriteRecipes});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return RecipeCard(
            recipe: recipes[index],
            itemHeight: itemHeight,
            toggleFavorite: toggleFavorite,
            isFavorite: favoriteRecipes.contains(recipes[index]),
          );
        },
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final RecipeDetail recipe;
  final double itemHeight;
  final Function(RecipeDetail) toggleFavorite;
  final bool isFavorite;

  RecipeCard({required this.recipe, required this.itemHeight, required this.toggleFavorite, required this.isFavorite});

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
        width: 150,
        margin: EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    recipe.imageUrl,
                    height: itemHeight - 100, // Adjusted height for image
                    width: 150,
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
