import 'package:flutter/material.dart';
import 'package:meals/app/models/meal.dart';
import 'package:meals/app/widgets/meal_item.dart';

// =========================================== //
// Favorite Screen
// =========================================== //
class FavoriteScreen extends StatelessWidget {
  // =========================================== //
  // Variables
  // =========================================== //
  final List<Meal> favoriteMeals;

  const FavoriteScreen({this.favoriteMeals});
  // =========================================== //
  // Functions
  // =========================================== //

  // =========================================== //
  // Screen
  // =========================================== //
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('Nenhuma refeição foi marcada como favorita!'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: favoriteMeals[index],
          );
        },
      );
    }
  }
}
