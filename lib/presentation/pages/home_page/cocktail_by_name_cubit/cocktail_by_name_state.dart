part of 'cocktail_by_name_cubit.dart';

@immutable
abstract class CocktailByNameState {}

class CocktailByNameInitialState extends CocktailByNameState {
  final List<CocktailEntity> cocktails;

  CocktailByNameInitialState({required this.cocktails});
}

class CocktailByNameLoadingState extends CocktailByNameState {}

class CocktailByNameErrorState extends CocktailByNameState {}
