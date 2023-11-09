import 'package:cocktail_app/core/di.dart';
import 'package:cocktail_app/core/failures_successes/failures.dart';
import 'package:cocktail_app/data/data_sources/fetch_random_cocktail_api.dart';
import 'package:cocktail_app/domain/entities/cocktail_entitiy.dart';
import 'package:cocktail_app/domain/repositories_contracts/fetch_random_cocktail_repo.dart';
import 'package:dartz/dartz.dart';

class FecthRandomCocktailImpl implements FetchRandomCocktailRepo {
  final FetchRandomCocktailApi cocktailApi = sl<FetchRandomCocktailApi>();

  @override
  Future<Either<Failure, CocktailEntity>> getRandomCocktail() async {
    try {
      return Right(await cocktailApi.getRandomCocktail());
    } on FetchFailure catch (e) {
      return Left(FetchFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<CocktailEntity>>> getCocktailByName(
      String search) async {
    try {
      return Right(await cocktailApi.getCocktailByName(search));
    } on FetchFailure catch (e) {
      return Left(FetchFailure(message: e.message));
    }
  }
}
