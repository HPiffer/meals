import 'package:flutter/material.dart';
import 'package:meals/app/models/meal.dart';
import 'package:meals/app/widgets/main_drawer.dart';

import 'favorite_screen.dart';
import 'category_page.dart';

// =========================================== //
// Tab Screen
// =========================================== //
class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen({this.favoriteMeals});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // =========================================== //
  // Variables
  // =========================================== //
  int _selectedScreenIndex = 0;
  List<Map<String, Object>> _screen;

  @override
  void initState() {
    super.initState();
    _screen = [
      {
        'title': 'Lista de Categorias',
        'screen': CategoryScreen(),
      },
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(
          favoriteMeals: widget.favoriteMeals,
        ),
      },
    ];
  }

  // =========================================== //
  // Functions
  // =========================================== //
  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  // =========================================== //
  // Screen
  // =========================================== //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screen[_selectedScreenIndex]['title'],
        ),
      ),
      drawer: MainDrawer(),
      body: _screen[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'favoritos',
          ),
        ],
      ),
    );
  }
}
