import 'package:flutter/material.dart';

import '../models/meals_model.dart';
import '../widgets/mealItem.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> _favouriteMeals;

  FavouriteScreen(this._favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (_favouriteMeals.isEmpty)
      return Center(
        child: Text('Favourites'),
      );
    else
      return ListView.builder(
        itemCount: _favouriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _favouriteMeals[index].id,
            title: _favouriteMeals[index].title,
            imageUrl: _favouriteMeals[index].imageUrl,
            duration: _favouriteMeals[index].duration,
            complexity: _favouriteMeals[index].complexity,
            affordability: _favouriteMeals[index].affordability,
          );
        },
      );
  }
}
