class IngredientData {
  static const List<String> allIngredients = [
    // Vegetables
    'tomato', 'onion', 'garlic', 'potato', 'carrot', 'bell pepper', 'cucumber',
    'lettuce', 'spinach', 'kale', 'broccoli', 'cauliflower', 'zucchini',
    'eggplant', 'mushroom', 'corn', 'peas', 'green beans', 'asparagus',
    'celery', 'radish', 'beetroot', 'turnip', 'parsnip', 'sweet potato',
    'pumpkin', 'butternut squash', 'acorn squash', 'brussels sprouts',
    'cabbage', 'bok choy', 'watercress', 'arugula', 'endive', 'fennel',
    'leek', 'shallot', 'scallion', 'chive', 'parsley', 'cilantro', 'basil',
    'oregano', 'thyme', 'rosemary', 'sage', 'mint', 'dill', 'bay leaf',
    
    // Fruits
    'apple', 'banana', 'orange', 'lemon', 'lime', 'grape', 'strawberry',
    'blueberry', 'raspberry', 'blackberry', 'peach', 'pear', 'plum',
    'apricot', 'cherry', 'pineapple', 'mango', 'papaya', 'kiwi',
    'avocado', 'coconut', 'fig', 'date', 'prune', 'raisin', 'cranberry',
    'pomegranate', 'watermelon', 'cantaloupe', 'honeydew', 'grapefruit',
    'tangerine', 'clementine', 'mandarin', 'lime', 'key lime',
    
    // Proteins
    'chicken', 'beef', 'pork', 'lamb', 'turkey', 'duck', 'fish',
    'salmon', 'tuna', 'cod', 'tilapia', 'shrimp', 'prawn', 'crab',
    'lobster', 'clam', 'mussel', 'oyster', 'scallop', 'egg',
    'tofu', 'tempeh', 'seitan', 'quinoa', 'lentil', 'chickpea',
    'black bean', 'kidney bean', 'pinto bean', 'navy bean', 'lima bean',
    'split pea', 'edamame', 'peanut', 'almond', 'walnut', 'pecan',
    'cashew', 'pistachio', 'macadamia', 'hazelnut', 'pine nut',
    'sunflower seed', 'pumpkin seed', 'sesame seed', 'chia seed',
    'flax seed', 'hemp seed',
    
    // Dairy & Alternatives
    'milk', 'cheese', 'yogurt', 'butter', 'cream', 'sour cream',
    'cottage cheese', 'ricotta cheese', 'mozzarella', 'cheddar',
    'parmesan', 'feta', 'goat cheese', 'blue cheese', 'gouda',
    'brie', 'camembert', 'provolone', 'swiss cheese', 'monterey jack',
    'cream cheese', 'mascarpone', 'buttermilk', 'heavy cream',
    'half and half', 'evaporated milk', 'condensed milk',
    'almond milk', 'soy milk', 'oat milk', 'coconut milk',
    'rice milk', 'cashew milk', 'hemp milk',
    
    // Grains & Starches
    'rice', 'pasta', 'bread', 'flour', 'sugar', 'salt', 'pepper',
    'white rice', 'brown rice', 'wild rice', 'basmati rice',
    'jasmine rice', 'arborio rice', 'quinoa', 'couscous', 'bulgur',
    'farro', 'barley', 'oats', 'oatmeal', 'cornmeal', 'polenta',
    'breadcrumbs', 'panko', 'tortilla', 'pita bread', 'naan',
    'bagel', 'croissant', 'biscuit', 'muffin', 'pancake', 'waffle',
    'all-purpose flour', 'bread flour', 'cake flour', 'whole wheat flour',
    'almond flour', 'coconut flour', 'rice flour', 'corn flour',
    
    // Oils & Fats
    'olive oil', 'vegetable oil', 'canola oil', 'coconut oil',
    'sesame oil', 'avocado oil', 'grapeseed oil', 'sunflower oil',
    'peanut oil', 'butter', 'margarine', 'shortening', 'lard',
    'bacon fat', 'duck fat', 'ghee', 'clarified butter',
    
    // Herbs & Spices
    'salt', 'black pepper', 'white pepper', 'cayenne pepper',
    'paprika', 'smoked paprika', 'chili powder', 'cumin', 'coriander',
    'turmeric', 'ginger', 'cinnamon', 'nutmeg', 'allspice', 'clove',
    'cardamom', 'saffron', 'vanilla', 'almond extract', 'lemon extract',
    'orange extract', 'mint extract', 'anise', 'fennel seed',
    'caraway seed', 'mustard seed', 'poppy seed', 'celery seed',
    'dill seed', 'oregano', 'basil', 'thyme', 'rosemary', 'sage',
    'marjoram', 'tarragon', 'chive', 'parsley', 'cilantro', 'dill',
    'bay leaf', 'curry powder', 'garam masala', 'five spice powder',
    'za\'atar', 'sumac', 'harissa', 'ras el hanout',
    
    // Condiments & Sauces
    'ketchup', 'mustard', 'mayonnaise', 'hot sauce', 'soy sauce',
    'worcestershire sauce', 'fish sauce', 'oyster sauce', 'hoisin sauce',
    'teriyaki sauce', 'barbecue sauce', 'ranch dressing', 'vinaigrette',
    'balsamic vinegar', 'apple cider vinegar', 'white vinegar',
    'red wine vinegar', 'rice vinegar', 'sherry vinegar',
    'honey', 'maple syrup', 'agave nectar', 'molasses', 'jam',
    'jelly', 'marmalade', 'peanut butter', 'almond butter',
    'tahini', 'hummus', 'guacamole', 'salsa', 'pesto',
    
    // Baking Ingredients
    'baking powder', 'baking soda', 'yeast', 'active dry yeast',
    'instant yeast', 'cornstarch', 'arrowroot', 'gelatin', 'agar agar',
    'chocolate', 'dark chocolate', 'milk chocolate', 'white chocolate',
    'cocoa powder', 'chocolate chips', 'vanilla extract', 'vanilla bean',
    'food coloring', 'sprinkles', 'powdered sugar', 'brown sugar',
    'granulated sugar', 'turbinado sugar', 'demerara sugar',
    
    // Other Common Ingredients
    'broth', 'stock', 'bouillon', 'tomato paste', 'tomato sauce',
    'crushed tomatoes', 'diced tomatoes', 'sun-dried tomatoes',
    'anchovy', 'capers', 'olive', 'pickle', 'sauerkraut', 'kimchi',
    'miso', 'nori', 'wakame', 'kombu', 'bonito flakes',
    'nutritional yeast', 'spirulina', 'matcha', 'coffee', 'tea',
    'lemon juice', 'lime juice', 'orange juice', 'apple juice',
    'cranberry juice', 'pomegranate juice', 'beer', 'wine',
    'red wine', 'white wine', 'sherry', 'brandy', 'rum', 'vodka',
    'whiskey', 'bourbon', 'scotch', 'gin', 'tequila', 'mezcal',
  ];

  static List<String> getSuggestions(String query) {
    if (query.isEmpty) {
      return [];
    }
    
    final lowercaseQuery = query.toLowerCase();
    return allIngredients
        .where((ingredient) => ingredient.toLowerCase().contains(lowercaseQuery))
        .take(10) // Limit to 10 suggestions
        .toList();
  }

  static List<String> getPopularIngredients() {
    return [
      'tomato', 'onion', 'garlic', 'chicken', 'rice', 'pasta',
      'cheese', 'egg', 'potato', 'carrot', 'bell pepper', 'mushroom',
      'spinach', 'lemon', 'olive oil', 'salt', 'black pepper',
      'basil', 'parsley', 'thyme', 'oregano', 'cumin', 'paprika',
    ];
  }

  static List<String> getIngredientsByCategory(String category) {
    switch (category.toLowerCase()) {
      case 'vegetables':
        return allIngredients.where((ingredient) => 
          ['tomato', 'onion', 'garlic', 'potato', 'carrot', 'bell pepper', 
           'cucumber', 'lettuce', 'spinach', 'kale', 'broccoli', 'cauliflower', 
           'zucchini', 'eggplant', 'mushroom', 'corn', 'peas', 'green beans', 
           'asparagus', 'celery', 'radish', 'beetroot', 'turnip', 'parsnip', 
           'sweet potato', 'pumpkin', 'butternut squash', 'acorn squash', 
           'brussels sprouts', 'cabbage', 'bok choy', 'watercress', 'arugula', 
           'endive', 'fennel', 'leek', 'shallot', 'scallion', 'chive', 
           'parsley', 'cilantro', 'basil', 'oregano', 'thyme', 'rosemary', 
           'sage', 'mint', 'dill', 'bay leaf'].contains(ingredient)).toList();
      
      case 'fruits':
        return allIngredients.where((ingredient) => 
          ['apple', 'banana', 'orange', 'lemon', 'lime', 'grape', 'strawberry',
           'blueberry', 'raspberry', 'blackberry', 'peach', 'pear', 'plum',
           'apricot', 'cherry', 'pineapple', 'mango', 'papaya', 'kiwi',
           'avocado', 'coconut', 'fig', 'date', 'prune', 'raisin', 'cranberry',
           'pomegranate', 'watermelon', 'cantaloupe', 'honeydew', 'grapefruit',
           'tangerine', 'clementine', 'mandarin'].contains(ingredient)).toList();
      
      case 'proteins':
        return allIngredients.where((ingredient) => 
          ['chicken', 'beef', 'pork', 'lamb', 'turkey', 'duck', 'fish',
           'salmon', 'tuna', 'cod', 'tilapia', 'shrimp', 'prawn', 'crab',
           'lobster', 'clam', 'mussel', 'oyster', 'scallop', 'egg',
           'tofu', 'tempeh', 'seitan', 'quinoa', 'lentil', 'chickpea',
           'black bean', 'kidney bean', 'pinto bean', 'navy bean', 'lima bean',
           'split pea', 'edamame', 'peanut', 'almond', 'walnut', 'pecan',
           'cashew', 'pistachio', 'macadamia', 'hazelnut', 'pine nut',
           'sunflower seed', 'pumpkin seed', 'sesame seed', 'chia seed',
           'flax seed', 'hemp seed'].contains(ingredient)).toList();
      
      case 'dairy':
        return allIngredients.where((ingredient) => 
          ['milk', 'cheese', 'yogurt', 'butter', 'cream', 'sour cream',
           'cottage cheese', 'ricotta cheese', 'mozzarella', 'cheddar',
           'parmesan', 'feta', 'goat cheese', 'blue cheese', 'gouda',
           'brie', 'camembert', 'provolone', 'swiss cheese', 'monterey jack',
           'cream cheese', 'mascarpone', 'buttermilk', 'heavy cream',
           'half and half', 'evaporated milk', 'condensed milk',
           'almond milk', 'soy milk', 'oat milk', 'coconut milk',
           'rice milk', 'cashew milk', 'hemp milk'].contains(ingredient)).toList();
      
      case 'grains':
        return allIngredients.where((ingredient) => 
          ['rice', 'pasta', 'bread', 'flour', 'white rice', 'brown rice', 
           'wild rice', 'basmati rice', 'jasmine rice', 'arborio rice', 
           'quinoa', 'couscous', 'bulgur', 'farro', 'barley', 'oats', 
           'oatmeal', 'cornmeal', 'polenta', 'breadcrumbs', 'panko', 
           'tortilla', 'pita bread', 'naan', 'bagel', 'croissant', 
           'biscuit', 'muffin', 'pancake', 'waffle', 'all-purpose flour', 
           'bread flour', 'cake flour', 'whole wheat flour', 'almond flour', 
           'coconut flour', 'rice flour', 'corn flour'].contains(ingredient)).toList();
      
      default:
        return [];
    }
  }
} 