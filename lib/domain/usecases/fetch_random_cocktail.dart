import 'package:cocktail_app/core/di.dart';
import 'package:cocktail_app/core/failures_successes/failures.dart';
import 'package:cocktail_app/domain/entities/cocktail_entitiy.dart';
import 'package:cocktail_app/domain/repositories_contracts/fetch_random_cocktail_repo.dart';
import 'package:dartz/dartz.dart';

class FetchRandomCocktailUsecase {
  final FetchRandomCocktailRepo fetchRepo = sl<FetchRandomCocktailRepo>();

  Future<Either<Failure, CocktailEntity>> getRandomCocktail() async {
    return await fetchRepo.getRandomCocktail();
  }

  Future<Either<Failure, List<CocktailEntity>>> getCocktailByName(
      String search) async {
    return await fetchRepo.getCocktailByName(search);
  }
}
