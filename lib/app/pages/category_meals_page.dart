import 'package:flutter/material.dart';
import 'package:meals/app/models/category.dart';
import 'package:meals/app/models/meal.dart';
import 'package:meals/app/widgets/meal_item.dart';

// =========================================== //
// Category Meals Category
// =========================================== //
class CategoriesMealsScreen extends StatelessWidget {
  // =========================================== //
  // Variables
  // =========================================== //
  final List<Meal> meals;

  const CategoriesMealsScreen({
    @required this.meals,
  });

  // =========================================== //
  // Functions
  // =========================================== //

  // =========================================== //
  // Screen
  // =========================================== //
  @override
  Widget build(BuildContext context) {
    //* Parâmetro utilizado para passar informação entre talas
    final category = ModalRoute.of(context).settings.arguments as Category;
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        //* Lista de itens
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: categoryMeals[index],
          );
        },
      ),
    );
  }
}
