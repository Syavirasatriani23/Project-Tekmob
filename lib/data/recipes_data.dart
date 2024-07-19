class RecipeDetail {
  final String imageUrl;
  final String title;
  final String chef;
  final double rating;
  final String description;
  final List<String> ingredients;
  final List<String> instructions;

  RecipeDetail({
    required this.imageUrl,
    required this.title,
    required this.chef,
    required this.rating,
    required this.description,
    required this.ingredients,
    required this.instructions,
  });
}

final List<RecipeDetail> recipes = [
  RecipeDetail(
    imageUrl: 'assets/avocado_toast.jpg',
    title: 'Avocado Toast with Egg',
    chef: 'Dominic Mysterio',
    rating: 4.5,
    description: 'Avocado toast with egg is a popular and nutritious breakfast or brunch dish that features creamy mashed avocado spread over toasted bread and topped with a cooked egg.',
    ingredients: [
      'Ripe avocado',
      'Sliced bread (commonly whole grain or sourdough)',
      'Eggs',
      'Salt and pepper',
      'Optional toppings (such as sliced tomatoes, red pepper flakes, feta cheese, or microgreens)'
    ],
    instructions: [
      'Prepare the Avocado: Cut the avocado in half lengthwise and remove the pit. Scoop out the flesh into a bowl and mash it with a fork until smooth. Season with salt and pepper to taste.',
      'Toast the Bread: Toast slices of bread until golden brown and crispy. You can use a toaster, toaster oven, or grill pan for this step.',
      'Cook the Egg: While the bread is toasting, cook the egg to your preference. Common options include fried, poached, or boiled.',
      'Assemble the Toast: Spread the mashed avocado evenly over the toasted bread. Place the cooked egg on top of the avocado spread. Add any optional toppings you like.',
      'Serve: Enjoy your avocado toast with egg immediately while it\'s fresh and warm.'
    ],
  ),
  RecipeDetail(
    imageUrl: 'assets/greek_yogurt.jpg',
    title: 'Greek Yogurt Parfait',
    chef: 'Dylan Woods',
    rating: 4.5,
    description: 'Greek yogurt parfait is a delicious and healthy breakfast or snack that combines creamy Greek yogurt with fresh fruit and crunchy granola.',
    ingredients: [
      'Greek yogurt',
      'Fresh fruit (such as berries, bananas, or apples)',
      'Granola',
      'Honey (optional)'
    ],
    instructions: [
      'Layer the Greek yogurt, fresh fruit, and granola in a bowl or glass.',
      'Drizzle with honey if desired.',
      'Serve immediately and enjoy your Greek yogurt parfait.'
    ],
  ),
  RecipeDetail(
    imageUrl: 'assets/avocado_salad.jpg',
    title: 'Avocado Salad',
    chef: 'Julian Roberts',
    rating: 4.5,
    description: 'A fresh and healthy avocado salad perfect for a light lunch or dinner.',
    ingredients: [
      'Ripe avocados',
      'Cherry tomatoes',
      'Red onion',
      'Cilantro',
      'Lime',
      'Salt and pepper',
    ],
    instructions: [
      'Chop the avocados, cherry tomatoes, and red onion.',
      'Mix them together in a bowl with chopped cilantro.',
      'Squeeze lime juice over the salad.',
      'Season with salt and pepper to taste.',
      'Toss gently and serve immediately.'
    ],
  ),
  RecipeDetail(
    imageUrl: 'assets/egg_breakfast.jpg',
    title: 'Simple Breakfast',
    chef: 'Anna Jean',
    rating: 4.5,
    description: 'A quick and easy breakfast with eggs and toast.',
    ingredients: [
      'Eggs',
      'Bread',
      'Butter',
      'Salt and pepper',
    ],
    instructions: [
      'Toast the bread to your liking.',
      'Cook the eggs to your preference (scrambled, fried, poached, etc.).',
      'Butter the toast and serve with eggs.',
      'Season with salt and pepper to taste.'
    ],
  ),
  RecipeDetail(
    imageUrl: 'assets/healthy_salad.jpg',
    title: 'Healthy Salad',
    chef: 'Mia Lee',
    rating: 4.7,
    description: 'A healthy and refreshing salad with mixed greens and vegetables.',
    ingredients: [
      'Mixed greens',
      'Cucumber',
      'Cherry tomatoes',
      'Red onion',
      'Feta cheese',
      'Olive oil',
      'Lemon juice',
      'Salt and pepper',
    ],
    instructions: [
      'Chop the cucumber, cherry tomatoes, and red onion.',
      'Mix them with the mixed greens in a large bowl.',
      'Sprinkle feta cheese on top.',
      'Drizzle with olive oil and lemon juice.',
      'Season with salt and pepper to taste.',
      'Toss gently and serve immediately.'
    ],
  ),
  RecipeDetail(
    imageUrl: 'assets/vegetable_stir_fry.jpg',
    title: 'Vegetable Stir Fry',
    chef: 'Liam Chen',
    rating: 4.5,
    description: 'A quick and easy vegetable stir fry perfect for dinner.',
    ingredients: [
      'Broccoli',
      'Bell peppers',
      'Carrots',
      'Soy sauce',
      'Garlic',
      'Ginger',
      'Olive oil',
    ],
    instructions: [
      'Chop the broccoli, bell peppers, and carrots.',
      'Heat olive oil in a pan over medium heat.',
      'Add garlic and ginger, and stir-fry for a minute.',
      'Add the chopped vegetables and stir-fry until tender.',
      'Add soy sauce and cook for another minute.',
      'Serve hot with rice or noodles.'
    ],
  ),
  RecipeDetail(
    imageUrl: 'assets/fruit_smoothie.jpeg',
    title: 'Fruit Smoothie',
    chef: 'Arjuna',
    rating: 4.5,
    description: 'A quick and easy vegetable stir fry perfect for dinner.',
    ingredients: [
      'Broccoli',
      'Bell peppers',
      'Carrots',
      'Soy sauce',
      'Garlic',
      'Ginger',
      'Olive oil',
    ],
    instructions: [
      'Chop the broccoli, bell peppers, and carrots.',
      'Heat olive oil in a pan over medium heat.',
      'Add garlic and ginger, and stir-fry for a minute.',
      'Add the chopped vegetables and stir-fry until tender.',
      'Add soy sauce and cook for another minute.',
      'Serve hot with rice or noodles.'
    ],
  ),
  RecipeDetail(
    imageUrl: 'assets/fluffy_pancakes.jpeg',
    title: 'Fluffy Pancakes',
    chef: 'Arnold',
    rating: 4.5,
    description: 'A quick and easy vegetable stir fry perfect for dinner.',
    ingredients: [
      'Broccoli',
      'Bell peppers',
      'Carrots',
      'Soy sauce',
      'Garlic',
      'Ginger',
      'Olive oil',
    ],
    instructions: [
      'Chop the broccoli, bell peppers, and carrots.',
      'Heat olive oil in a pan over medium heat.',
      'Add garlic and ginger, and stir-fry for a minute.',
      'Add the chopped vegetables and stir-fry until tender.',
      'Add soy sauce and cook for another minute.',
      'Serve hot with rice or noodles.'
    ],
  ),
];
