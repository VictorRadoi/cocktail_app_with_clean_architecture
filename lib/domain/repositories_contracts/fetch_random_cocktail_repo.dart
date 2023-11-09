import 'package:cocktail_app/core/failures_successes/failures.dart';
import 'package:cocktail_app/domain/entities/cocktail_entitiy.dart';
import 'package:dartz/dartz.dart';

abstract class FetchRandomCocktailRepo {
  Future<Either<Failure, CocktailEntity>> getRandomCocktail();
  Future<Either<Failure, List<CocktailEntity>>> getCocktailByName(
      String search);
}
