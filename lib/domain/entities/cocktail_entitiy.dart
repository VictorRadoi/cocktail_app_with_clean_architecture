class CocktailEntity {
  final String? name;
  final String? tags;
  final String? category;
  final String? instructions;
  final String? imageURL;
  final List<String>? ingredients;
  final List<String>? meausrements;

  CocktailEntity({
    required this.name,
    required this.tags,
    required this.category,
    required this.instructions,
    required this.imageURL,
    required this.ingredients,
    required this.meausrements,
  });

  CocktailEntity.empty()
      : name = 'muie la nume',
        category = 'muie la categorie',
        tags = 'muie la taguri',
        instructions = 'muie la instructiuni',
        imageURL = 'muie la poza',
        ingredients = ['muie la ingrediente'],
        meausrements = ['muie la masuri'];
}
