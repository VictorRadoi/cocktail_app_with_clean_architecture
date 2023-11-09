import 'package:cocktail_app/core/services/api_service.dart';
import 'package:cocktail_app/data/data_sources/fetch_random_cocktail_api.dart';
import 'package:cocktail_app/data/repositories_implementation/fetch_random_cocktail_repo.dart';
import 'package:cocktail_app/domain/repositories_contracts/fetch_random_cocktail_repo.dart';
import 'package:cocktail_app/domain/usecases/fetch_random_cocktail.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void setUpServices() {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<ApiService>(ApiServiceImpl());
  sl.registerSingleton<FetchRandomCocktailApi>(FetchFromRemoteApiImpl());
  sl.registerSingleton<FetchRandomCocktailRepo>(FecthRandomCocktailImpl());
  sl.registerSingleton<FetchRandomCocktailUsecase>(
      FetchRandomCocktailUsecase());
}
