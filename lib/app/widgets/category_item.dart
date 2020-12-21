import 'package:flutter/material.dart';
import 'package:meals/app/models/category.dart';
import 'package:meals/app/utils/app_routes.dart';

// =========================================== //
//  Category Item Widget
// =========================================== //
class CategoryItem extends StatelessWidget {
  // =========================================== //
  // Variables
  // =========================================== //
  final Category category;

  const CategoryItem({
    this.category,
  });

  // =========================================== //
  // Functions
  // =========================================== //
  void _selectedCategory(BuildContext context) {
    //* Navegação entre telas
    Navigator.of(context).pushNamed(
      AppRoute.CATEGORIES_MEALS,
      arguments: category, //* Passa os argumentos necessários
    );
  }

  // =========================================== //
  // Widget
  // =========================================== //
  @override
  Widget build(BuildContext context) {
    return InkWell(
      //? Para obter o OnTap e uma animação rápida
      onTap: () => _selectedCategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor, //? animação
      child: Container(
        padding: EdgeInsets.all(15),
        //* Titulo da categoria
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          //* Gradiente Color
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
