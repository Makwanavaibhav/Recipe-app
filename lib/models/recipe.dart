class Recipe {
  final int id;
  final String title;
  final String image;
  final List<UsedIngredient> usedIngredients;
  final List<MissedIngredient> missedIngredients;
  final List<MissedIngredient> unusedIngredients;
  final int likes;

  Recipe({
    required this.id,
    required this.title,
    required this.image,
    required this.usedIngredients,
    required this.missedIngredients,
    required this.unusedIngredients,
    required this.likes,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      usedIngredients: (json['usedIngredients'] as List<dynamic>?)
          ?.map((e) => UsedIngredient.fromJson(e))
          .toList() ?? [],
      missedIngredients: (json['missedIngredients'] as List<dynamic>?)
          ?.map((e) => MissedIngredient.fromJson(e))
          .toList() ?? [],
      unusedIngredients: (json['unusedIngredients'] as List<dynamic>?)
          ?.map((e) => MissedIngredient.fromJson(e))
          .toList() ?? [],
      likes: json['likes'] ?? 0,
    );
  }
}

class UsedIngredient {
  final int id;
  final double amount;
  final String unit;
  final String unitLong;
  final String unitShort;
  final String aisle;
  final String name;
  final String original;
  final String originalName;
  final List<String> meta;
  final String image;

  UsedIngredient({
    required this.id,
    required this.amount,
    required this.unit,
    required this.unitLong,
    required this.unitShort,
    required this.aisle,
    required this.name,
    required this.original,
    required this.originalName,
    required this.meta,
    required this.image,
  });

  factory UsedIngredient.fromJson(Map<String, dynamic> json) {
    return UsedIngredient(
      id: json['id'] ?? 0,
      amount: (json['amount'] ?? 0).toDouble(),
      unit: json['unit'] ?? '',
      unitLong: json['unitLong'] ?? '',
      unitShort: json['unitShort'] ?? '',
      aisle: json['aisle'] ?? '',
      name: json['name'] ?? '',
      original: json['original'] ?? '',
      originalName: json['originalName'] ?? '',
      meta: List<String>.from(json['meta'] ?? []),
      image: json['image'] ?? '',
    );
  }
}

class MissedIngredient {
  final int id;
  final double amount;
  final String unit;
  final String unitLong;
  final String unitShort;
  final String aisle;
  final String name;
  final String original;
  final String originalName;
  final List<String> meta;
  final String image;
  final String? extendedName;
  final String? imageType;

  MissedIngredient({
    required this.id,
    required this.amount,
    required this.unit,
    required this.unitLong,
    required this.unitShort,
    required this.aisle,
    required this.name,
    required this.original,
    required this.originalName,
    required this.meta,
    required this.image,
    this.extendedName,
    this.imageType,
  });

  factory MissedIngredient.fromJson(Map<String, dynamic> json) {
    return MissedIngredient(
      id: json['id'] ?? 0,
      amount: (json['amount'] ?? 0).toDouble(),
      unit: json['unit'] ?? '',
      unitLong: json['unitLong'] ?? '',
      unitShort: json['unitShort'] ?? '',
      aisle: json['aisle'] ?? '',
      name: json['name'] ?? '',
      original: json['original'] ?? '',
      originalName: json['originalName'] ?? '',
      meta: List<String>.from(json['meta'] ?? []),
      image: json['image'] ?? '',
      extendedName: json['extendedName'],
      imageType: json['imageType'],
    );
  }
}

class RecipeDetails {
  final int id;
  final String title;
  final String image;
  final String imageType;
  final int servings;
  final int readyInMinutes;
  final String license;
  final String sourceName;
  final String sourceUrl;
  final String spoonacularSourceUrl;
  final int aggregateLikes;
  final double healthScore;
  final double spoonacularScore;
  final double pricePerServing;
  final List<dynamic> analyzedInstructions;
  final bool cheap;
  final String creditsText;
  final List<String> cuisines;
  final bool dairyFree;
  final List<String> diets;
  final String gaps;
  final bool glutenFree;
  final String instructions;
  final bool ketogenic;
  final bool lowFodmap;
  final List<String> occasions;
  final bool sustainable;
  final bool vegan;
  final bool vegetarian;
  final bool veryHealthy;
  final bool veryPopular;
  final bool whole30;
  final int weightWatcherSmartPoints;
  final List<String> dishTypes;
  final List<ExtendedIngredient> extendedIngredients;
  final String summary;

  RecipeDetails({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
    required this.servings,
    required this.readyInMinutes,
    required this.license,
    required this.sourceName,
    required this.sourceUrl,
    required this.spoonacularSourceUrl,
    required this.aggregateLikes,
    required this.healthScore,
    required this.spoonacularScore,
    required this.pricePerServing,
    required this.analyzedInstructions,
    required this.cheap,
    required this.creditsText,
    required this.cuisines,
    required this.dairyFree,
    required this.diets,
    required this.gaps,
    required this.glutenFree,
    required this.instructions,
    required this.ketogenic,
    required this.lowFodmap,
    required this.occasions,
    required this.sustainable,
    required this.vegan,
    required this.vegetarian,
    required this.veryHealthy,
    required this.veryPopular,
    required this.whole30,
    required this.weightWatcherSmartPoints,
    required this.dishTypes,
    required this.extendedIngredients,
    required this.summary,
  });

  factory RecipeDetails.fromJson(Map<String, dynamic> json) {
    return RecipeDetails(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      imageType: json['imageType'] ?? '',
      servings: json['servings'] ?? 0,
      readyInMinutes: json['readyInMinutes'] ?? 0,
      license: json['license'] ?? '',
      sourceName: json['sourceName'] ?? '',
      sourceUrl: json['sourceUrl'] ?? '',
      spoonacularSourceUrl: json['spoonacularSourceUrl'] ?? '',
      aggregateLikes: json['aggregateLikes'] ?? 0,
      healthScore: (json['healthScore'] ?? 0).toDouble(),
      spoonacularScore: (json['spoonacularScore'] ?? 0).toDouble(),
      pricePerServing: (json['pricePerServing'] ?? 0).toDouble(),
      analyzedInstructions: json['analyzedInstructions'] ?? [],
      cheap: json['cheap'] ?? false,
      creditsText: json['creditsText'] ?? '',
      cuisines: List<String>.from(json['cuisines'] ?? []),
      dairyFree: json['dairyFree'] ?? false,
      diets: List<String>.from(json['diets'] ?? []),
      gaps: json['gaps'] ?? '',
      glutenFree: json['glutenFree'] ?? false,
      instructions: json['instructions'] ?? '',
      ketogenic: json['ketogenic'] ?? false,
      lowFodmap: json['lowFodmap'] ?? false,
      occasions: List<String>.from(json['occasions'] ?? []),
      sustainable: json['sustainable'] ?? false,
      vegan: json['vegan'] ?? false,
      vegetarian: json['vegetarian'] ?? false,
      veryHealthy: json['veryHealthy'] ?? false,
      veryPopular: json['veryPopular'] ?? false,
      whole30: json['whole30'] ?? false,
      weightWatcherSmartPoints: json['weightWatcherSmartPoints'] ?? 0,
      dishTypes: List<String>.from(json['dishTypes'] ?? []),
      extendedIngredients: (json['extendedIngredients'] as List<dynamic>?)
          ?.map((e) => ExtendedIngredient.fromJson(e))
          .toList() ?? [],
      summary: json['summary'] ?? '',
    );
  }
}

class ExtendedIngredient {
  final int id;
  final String aisle;
  final double amount;
  final String unit;
  final String name;
  final String original;
  final String originalName;
  final List<String> meta;
  final String image;

  ExtendedIngredient({
    required this.id,
    required this.aisle,
    required this.amount,
    required this.unit,
    required this.name,
    required this.original,
    required this.originalName,
    required this.meta,
    required this.image,
  });

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) {
    return ExtendedIngredient(
      id: json['id'] ?? 0,
      aisle: json['aisle'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      unit: json['unit'] ?? '',
      name: json['name'] ?? '',
      original: json['original'] ?? '',
      originalName: json['originalName'] ?? '',
      meta: List<String>.from(json['meta'] ?? []),
      image: json['image'] ?? '',
    );
  }
} 