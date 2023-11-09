import 'package:cocktail_app/core/failures_successes/exceptions.dart';
import 'package:cocktail_app/core/failures_successes/failures.dart';
import 'package:cocktail_app/core/services/base_service.dart';
import 'package:dartz/dartz.dart';

abstract class ApiService {
  Future<Either<Failure, Map<String, dynamic>>> getRandomCocktail();
  Future<Either<Failure, Map<String, dynamic>>> getCocktailByName(
      String search);
}

class ApiServiceImpl extends BaseService implements ApiService {
  @override
  Future<Either<Failure, Map<String, dynamic>>> getRandomCocktail() async {
    final result = await get('random.php');

    return result.fold(
      (failure) {
        return Left(failure);
      },
      (response) {
        if (response.statusCode == 200) {
          return Right(response.data as Map<String, dynamic>);
        } else {
          throw FetchExceptions(message: 'Failed to fetch data');
        }
      },
    );
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getCocktailByName(
      String search) async {
    final result = await get('search.php?s=${search.toLowerCase()}');

    return result.fold(
      (failure) {
        return Left(failure);
      },
      (response) {
        if (response.statusCode == 200) {
          return Right(response.data as Map<String, dynamic>);
        } else {
          throw FetchExceptions(message: 'Failed to fetch data');
        }
      },
    );
  }
}
