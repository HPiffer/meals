import 'package:flutter/material.dart';
import 'package:meals/app/data/dummy_data.dart';
import 'package:meals/app/widgets/category_item.dart';

// =========================================== //
// Category Page
// =========================================== //
class CategoryScreen extends StatelessWidget {
  // =========================================== //
  // Functions
  // =========================================== //

  // =========================================== //
  // Screen
  // =========================================== //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vamos Cozinhar?'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((cat) {
          return CategoryItem(
            category: cat,
          );
        }).toList(),
      ),
    );
  }
}
