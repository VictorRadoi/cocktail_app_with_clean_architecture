import 'package:cocktail_app/domain/entities/cocktail_entitiy.dart';
import 'package:cocktail_app/presentation/pages/cocktail_page/cocktail_page.dart';
import 'package:flutter/material.dart';

class CocktailCard extends StatelessWidget {
  final CocktailEntity cocktailEntity;
  const CocktailCard({
    super.key,
    required this.cocktailEntity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return CocktailPage(
              cocktailEntity: cocktailEntity,
            );
          },
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  cocktailEntity.imageURL ??
                      'https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg',
                  height: 100,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      cocktailEntity.name ?? 'Cocktail Name',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    cocktailEntity.category ?? 'Cocktail Category',
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_rounded,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
