import 'package:cocktail_app/core/di.dart';
import 'package:cocktail_app/core/failures_successes/exceptions.dart';
import 'package:cocktail_app/core/failures_successes/failures.dart';
import 'package:cocktail_app/core/services/api_service.dart';
import 'package:cocktail_app/data/models/cocktail_model.dart';
import 'package:dartz/dartz.dart';

abstract class FetchRandomCocktailApi {
  Future<CocktailModel> getRandomCocktail();
  Future<List<CocktailModel>> getCocktailByName(String search);
}

class FetchFromRemoteApiImpl implements FetchRandomCocktailApi {
  final ApiService apiService = sl<ApiService>();

  @override
  Future<CocktailModel> getRandomCocktail() async {
    try {
      final Either<Failure, Map<String, dynamic>> result =
          await apiService.getRandomCocktail();

      return result.fold((failure) {
        throw FetchExceptions(message: failure.message);
      }, (data) {
        Map<String, dynamic> cocktailMap =
            data['drinks'][0] as Map<String, dynamic>;
        CocktailModel cocktail = CocktailModel.fromMap(cocktailMap);
        return cocktail;
      });
    } catch (e) {
      throw FetchExceptions(message: 'Failed to get data');
    }
  }

  @override
  Future<List<CocktailModel>> getCocktailByName(String search) async {
    try {
      final Either<Failure, Map<String, dynamic>> result =
          await apiService.getCocktailByName(search);

      return result.fold(
        (failure) {
          throw FetchExceptions(message: failure.message);
        },
        (data) {
          List<CocktailModel> cocktails = [];

          final drinks = data['drinks'];

          if (drinks != null) {
            for (var cocktailMap in drinks) {
              CocktailModel cocktail = CocktailModel.fromMap(cocktailMap);
              cocktails.add(cocktail);
            }
          }

          return cocktails;
        },
      );
    } catch (e) {
      throw FetchExceptions(message: 'Failed to get data');
    }
  }
}
