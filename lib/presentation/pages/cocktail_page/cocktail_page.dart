import 'package:cocktail_app/domain/entities/cocktail_entitiy.dart';
import 'package:flutter/material.dart';

class CocktailPage extends StatelessWidget {
  final CocktailEntity cocktailEntity;
  const CocktailPage({Key? key, required this.cocktailEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_rounded),
          ),
        ],
        backgroundColor: Colors.white,
        title: Text(
          cocktailEntity.name ?? 'Cocktail name',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.network(
              cocktailEntity.imageURL ?? 'https://via.placeholder.com/150',
              height: 250,
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 20, right: 20),
                  child: Text(
                    cocktailEntity.category ?? 'Cocktail category',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Ingredients',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Wrap(
              spacing: 5.0,
              children: List<Widget>.generate(
                cocktailEntity.ingredients?.length ?? 0,
                (int index) {
                  return ChoiceChip(
                    label: Text(
                      '${cocktailEntity.ingredients![index]} / ${cocktailEntity.meausrements![index]}',
                    ),
                    selected: true,
                    labelStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                    selectedColor: Colors.grey[300],
                  );
                },
              ).toList(),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Description',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              cocktailEntity.instructions ?? '',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
