import 'package:cocktail_app/core/di.dart';
import 'package:cocktail_app/presentation/pages/home_page/cocktail_by_name_cubit/cocktail_by_name_cubit.dart';
import 'package:cocktail_app/presentation/pages/home_page/home_page.dart';
import 'package:cocktail_app/presentation/pages/home_page/random_cocktail_cubit/random_cocktail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServices();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.white, // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return RandomCocktailCubit();
          },
        ),
        BlocProvider(
          create: (context) {
            return CocktailByNameCubit();
          },
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
