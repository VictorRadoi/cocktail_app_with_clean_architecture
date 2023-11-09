import 'package:cocktail_app/core/constants/palette.dart';
import 'package:cocktail_app/core/di.dart';
import 'package:cocktail_app/domain/usecases/fetch_random_cocktail.dart';
import 'package:cocktail_app/presentation/pages/home_page/cocktail_by_name_cubit/cocktail_by_name_cubit.dart';
import 'package:cocktail_app/presentation/pages/home_page/random_cocktail_cubit/random_cocktail_cubit.dart';
import 'package:cocktail_app/presentation/widgets/cocktail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FetchRandomCocktailUsecase fetchRandomCocktailUsecase =
      sl<FetchRandomCocktailUsecase>();

  bool searching = false;
  @override
  void initState() {
    super.initState();
    context.read<RandomCocktailCubit>().getRandomCocktail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Cocktails',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (search) {
                if (search.trim().isNotEmpty) {
                  // Fetch cocktails by name if the search text is not empty
                  context.read<CocktailByNameCubit>().getCocktailByName(search);
                  searching = true;
                } else if (search.trim().isEmpty) {
                  searching = false;
                }
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      BorderSide(color: Colors.grey[300] ?? Colors.grey),
                ),
                fillColor: Colors.grey[300],
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                icon: Icon(Icons.menu, color: Colors.grey[800]),
                hintText: 'Search',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Cocktail of the day',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            BlocBuilder<RandomCocktailCubit, RandomCocktailState>(
              builder: (context, state) {
                if (state is RandomCocktailInitialState) {
                  return CocktailCard(cocktailEntity: state.cocktail);
                } else if (state is RandomCocktailLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Palette.darkred,
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('Error'),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            searching
                ? const Text(
                    'Results',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                : const SizedBox(),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<CocktailByNameCubit, CocktailByNameState>(
                builder: (context, state) {
                  if (state is CocktailByNameInitialState) {
                    return ListView.builder(
                      itemCount: state.cocktails.length,
                      itemBuilder: (context, index) {
                        return CocktailCard(
                            cocktailEntity: state.cocktails[index]);
                      },
                    );
                  } else if (state is CocktailByNameLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Palette.darkred,
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text('Error'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
