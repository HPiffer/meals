import 'package:flutter/material.dart';
import 'package:meals/app/data/dummy_data.dart';
import 'package:meals/app/models/meal.dart';
import 'package:meals/app/models/setting.dart';
import 'package:meals/app/pages/settings_screen.dart';
import 'package:meals/app/pages/tabs_screen.dart';

import 'app/pages/category_meals_page.dart';
import 'app/pages/meal_detail_page.dart';
import 'app/utils/app_routes.dart';

// =========================================== //
// Nome do App: MEALS
// ------------------------------------------- //
// Dev        : Hayron S. Piffer
// Descrição  : App de refeições
// =========================================== //
void main() => runApp(MyApp());

// =========================================== //
// Main Application
// =========================================== //
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // =========================================== //
  // Variables
  // =========================================== //
  List<Meal> _avaibleMeals = DUMMY_MEALS;
  Settings settings = Settings();
  List<Meal> _favoriteMeals = [];

  // =========================================== //
  // Functions
  // =========================================== //
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _avaibleMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  // =========================================== //
  // Screen
  // =========================================== //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1), //* Cor padrão do fundo
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto Condensed',
              ),
            ),
      ),
      // home: CategoryScreen(), //* Subistituida pelo AppRoute.HOME
      routes: {
        AppRoute.HOME: (ctx) => TabsScreen(
              favoriteMeals: _favoriteMeals,
            ),
        AppRoute.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(
              meals: _avaibleMeals,
            ),
        AppRoute.MEAL_DETAIL: (ctx) => MealDetailScreen(
              onToggleFavorite: _toggleFavorite,
              isFavorite: _isFavorite,
            ),
        AppRoute.SETTINGS: (ctx) => SettingsScreen(
              onSettingsChange: _filterMeals,
              settings: settings,
            ),
      },
    );
  }
}
