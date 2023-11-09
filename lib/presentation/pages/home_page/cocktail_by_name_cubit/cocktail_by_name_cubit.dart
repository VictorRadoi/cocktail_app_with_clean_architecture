import 'package:bloc/bloc.dart';
import 'package:cocktail_app/core/di.dart';
import 'package:cocktail_app/domain/entities/cocktail_entitiy.dart';
import 'package:cocktail_app/domain/usecases/fetch_random_cocktail.dart';
import 'package:meta/meta.dart';

part 'cocktail_by_name_state.dart';

class CocktailByNameCubit extends Cubit<CocktailByNameState> {
  CocktailByNameCubit()
      : super(CocktailByNameInitialState(cocktails: const []));

  final FetchRandomCocktailUsecase fetchRandomCocktailUsecase =
      sl<FetchRandomCocktailUsecase>();

  void getCocktailByName(String search) async {
    emit(CocktailByNameLoadingState());
    final result = await fetchRandomCocktailUsecase.getCocktailByName(search);
    result.fold(
      (l) => emit(CocktailByNameErrorState()),
      (cocktails) => emit(CocktailByNameInitialState(cocktails: cocktails)),
    );
  }
}
