part of 'random_cocktail_cubit.dart';

@immutable
abstract class RandomCocktailState {}

class RandomCocktailInitialState extends RandomCocktailState {
  final CocktailEntity cocktail;

  RandomCocktailInitialState({required this.cocktail});
}

class RandomCocktailLoadingState extends RandomCocktailState {}

class RandomCocktailErrorState extends RandomCocktailState {}
