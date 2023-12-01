import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/Screens/categories_screen.dart';
import 'package:meals/Screens/filters_screen.dart';
import 'package:meals/Screens/meals_screen.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:meals/providers/filters_provider.dart';

class TabScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedIndex = 0;
  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void setScreen(String identifier) async {
    if (identifier == 'Meals') {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop();
      await Navigator.of(context)
          .push<Map<Filter, bool>>(MaterialPageRoute(builder: (context) {
        return filtersScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);

    final availableMeals = meals.where((meal) {
      var selectedFIlter = ref.watch(filterProvider);
      if (selectedFIlter[Filter.gluetenFree]! && !meal.isGlutenFree)
        return false;
      if (selectedFIlter[Filter.lactoseFree]! && !meal.isLactoseFree)
        return false;
      if (selectedFIlter[Filter.vegeterian]! && !meal.isVegetarian)
        return false;
      if (selectedFIlter[Filter.vegan]! && !meal.isVegan) return false;
      return true;
    }).toList();

    String appTitle = 'Categories';
    Widget activeScreen = categoriesScreen(
      availableMeals: availableMeals,
    );
    if (_selectedIndex == 1) {
      final FavMeals = ref.watch(favoriteMealsProvider);
      appTitle = 'YourFavourites';
      activeScreen = mealsScreen(
        meals: FavMeals,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      drawer: mainDrawer(onSelectScreen: setScreen),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.food_bank_outlined), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), label: 'Favourites'),
          ]),
    );
  }
}
