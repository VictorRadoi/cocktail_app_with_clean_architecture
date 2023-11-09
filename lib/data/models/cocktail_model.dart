import 'package:cocktail_app/domain/entities/cocktail_entitiy.dart';

class CocktailModel extends CocktailEntity {
  CocktailModel({
    required String? id,
    required String? name,
    required String? tags,
    required String? alcoholic,
    required String? glass,
    required String? category,
    required String? instructions,
    required String? imageURL,
    required List<String> ingredients,
    required List<String> measures,
  }) : super(
          name: name,
          tags: tags,
          category: category,
          instructions: instructions,
          imageURL: imageURL,
          ingredients: ingredients,
          meausrements: measures,
        );

  factory CocktailModel.fromMap(Map<String, dynamic> json) {
    List<String> ingredients = [];
    List<String> measures = [];

    for (int i = 1; i <= 15; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];

      if (ingredient != null) {
        ingredients.add(ingredient);
      }

      if (measure != null) {
        measures.add(measure);
      }
    }

    print('Ingredients: $ingredients');
    print('Measures: $measures');

    return CocktailModel(
      id: json['idDrink'],
      name: json['strDrink'],
      category: json['strCategory'],
      alcoholic: json['strAlcoholic'],
      glass: json['strGlass'],
      instructions: json['strInstructions'],
      imageURL: json['strDrinkThumb'],
      ingredients: ingredients,
      measures: measures,
      tags: json['strTags'],
    );
  }
}
