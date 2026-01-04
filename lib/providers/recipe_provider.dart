import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';

class RecipeProvider with ChangeNotifier {
  static const String _apiKey = 'e4c7bb204c0e4395ad89fc497f79c514';
  static const String _baseUrl = 'https://api.spoonacular.com/recipes';
  
  List<Recipe> _recipes = [];
  bool _isLoading = false;
  String _error = '';
  
  List<Recipe> get recipes => _recipes;
  bool get isLoading => _isLoading;
  String get error => _error;
  
  Future<void> findRecipesByIngredients(List<String> ingredients) async {
    if (ingredients.isEmpty) {
      _error = 'Please add at least one ingredient';
      notifyListeners();
      return;
    }
    
    _isLoading = true;
    _error = '';
    notifyListeners();
    
    try {
      final ingredientsString = ingredients.join(',');
      final url = Uri.parse(
        '$_baseUrl/findByIngredients?apiKey=$_apiKey&ingredients=$ingredientsString&number=20&ranking=2&ignorePantry=true'
      );
      
      final response = await http.get(url);
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _recipes = data.map((json) => Recipe.fromJson(json)).toList();
        _error = '';
      } else {
        _error = 'Failed to load recipes. Please try again.';
        _recipes = [];
      }
    } catch (e) {
      _error = 'Network error. Please check your connection.';
      _recipes = [];
    }
    
    _isLoading = false;
    notifyListeners();
  }
  
  Future<RecipeDetails?> getRecipeDetails(int recipeId) async {
    try {
      final url = Uri.parse(
        '$_baseUrl/$recipeId/information?apiKey=$_apiKey'
      );
      
      final response = await http.get(url);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return RecipeDetails.fromJson(data);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching recipe details: $e');
      }
    }
    
    return null;
  }
  
  void clearRecipes() {
    _recipes = [];
    _error = '';
    notifyListeners();
  }
} 