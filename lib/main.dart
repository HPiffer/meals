import 'package:flutter/material.dart';
import 'package:meals/app/pages/tabs_screen.dart';

import 'app/pages/category_meals_page.dart';
import 'app/pages/meal_detail_page.dart';
import 'app/pages/category_page.dart';
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
class MyApp extends StatelessWidget {
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
        AppRoute.HOME: (ctx) => TabsScreen(),
        AppRoute.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
        AppRoute.MEAL_DETAIL: (ctx) => MealDetailScreen(),
      },
    );
  }
}
