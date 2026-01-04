# Recipe Finder App

A Flutter-based reverse recipe suggestion app that helps you find delicious recipes based on the ingredients you have available. The app uses the Spoonacular API to provide recipe recommendations.

## Features

- **Ingredient-based Recipe Search**: Enter the ingredients you have and find recipes that use them
- **Recipe Details**: View comprehensive recipe information including instructions, nutritional info, and dietary restrictions
- **Missing Ingredients**: See which additional ingredients you need for each recipe
- **Recipe Images**: Beautiful recipe images with caching for better performance
- **External Links**: Open original recipe sources in your browser
- **Modern UI**: Clean, intuitive interface with Material Design 3

## Screenshots

The app features:
- Home screen with ingredient input
- Recipe search results with cards
- Detailed recipe view with instructions
- Ingredient management with chips

## Setup Instructions

### Prerequisites

- Flutter SDK (latest stable version)
- Android Studio or VS Code
- Android emulator or physical device
- Internet connection for API calls

### Installation

1. **Clone or download the project**
   ```bash
   git clone <repository-url>
   cd recipe
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### API Key Configuration

The app is already configured with the Spoonacular API key: `e4c7bb204c0e4395ad89fc497f79c514`

If you need to use your own API key:
1. Sign up at [Spoonacular](https://spoonacular.com/food-api)
2. Get your API key
3. Replace the API key in `lib/providers/recipe_provider.dart` line 8

## How to Use

1. **Add Ingredients**: 
   - Type ingredient names in the input field
   - Press the + button or Enter to add them
   - Add multiple ingredients (e.g., "chicken", "rice", "tomatoes")

2. **Search Recipes**:
   - Click "Find Recipes" after adding ingredients
   - The app will search for recipes that use your ingredients

3. **Browse Results**:
   - View recipe cards with images and basic info
   - See which ingredients are used vs. missing
   - Check recipe ratings and popularity

4. **View Recipe Details**:
   - Tap on any recipe card to see full details
   - View complete ingredient lists
   - Read cooking instructions
   - Check dietary information
   - Open original recipe source

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   └── recipe.dart          # Data models for recipes
├── providers/
│   └── recipe_provider.dart # State management and API calls
├── screens/
│   ├── home_screen.dart     # Main screen with ingredient input
│   └── recipe_detail_screen.dart # Recipe details view
└── widgets/
    ├── ingredient_input.dart # Ingredient management widget
    ├── recipe_card.dart     # Individual recipe display
    └── recipe_list.dart     # Recipe search results
```

## Dependencies

- **http**: For API requests to Spoonacular
- **provider**: State management
- **cached_network_image**: Image loading and caching
- **url_launcher**: Opening external recipe links

## API Endpoints Used

- `findByIngredients`: Search recipes by available ingredients
- `recipe information`: Get detailed recipe information

## Features in Detail

### Ingredient Management
- Add multiple ingredients with autocomplete suggestions
- Remove ingredients with chip deletion
- Input validation and duplicate prevention

### Recipe Search
- Real-time search with loading indicators
- Error handling for network issues
- Recipe ranking by ingredient match

### Recipe Details
- Complete ingredient lists with measurements
- Step-by-step cooking instructions
- Nutritional and dietary information
- Cooking time and serving size
- External source links

## Troubleshooting

### Common Issues

1. **No recipes found**:
   - Try different ingredient combinations
   - Check spelling of ingredient names
   - Use common ingredient names

2. **Network errors**:
   - Check internet connection
   - Verify API key is valid
   - Try again later

3. **App not loading**:
   - Run `flutter clean` and `flutter pub get`
   - Check Flutter version compatibility
   - Restart the development server

### Performance Tips

- The app caches images for better performance
- API calls are optimized to minimize data usage
- Error states are handled gracefully

## Contributing

Feel free to contribute to this project by:
- Reporting bugs
- Suggesting new features
- Submitting pull requests
- Improving documentation

## License

This project is open source and available under the MIT License.

## Support

For support or questions:
- Check the troubleshooting section above
- Review the Spoonacular API documentation
- Open an issue in the project repository

---

**Note**: This app uses the Spoonacular API which has rate limits. For production use, consider upgrading to a paid plan for higher limits and additional features.
