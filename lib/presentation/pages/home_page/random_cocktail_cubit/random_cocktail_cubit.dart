import 'package:bloc/bloc.dart';
import 'package:cocktail_app/core/di.dart';
import 'package:cocktail_app/core/failures_successes/failures.dart';
import 'package:cocktail_app/domain/entities/cocktail_entitiy.dart';
import 'package:cocktail_app/domain/usecases/fetch_random_cocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'random_cocktail_state.dart';

class RandomCocktailCubit extends Cubit<RandomCocktailState> {
  RandomCocktailCubit()
      : super(RandomCocktailInitialState(cocktail: CocktailEntity.empty()));

  final FetchRandomCocktailUsecase _fetchRandomCocktailUsecase =
      sl<FetchRandomCocktailUsecase>();

  void getRandomCocktail() async {
    emit(RandomCocktailLoadingState());
    final Either<Failure, CocktailEntity> getRandomCocktailResult =
        await _fetchRandomCocktailUsecase.getRandomCocktail();
    getRandomCocktailResult.fold(
      (l) => emit(RandomCocktailErrorState()),
      (cocktail) => emit(RandomCocktailInitialState(cocktail: cocktail)),
    );
  }
}
