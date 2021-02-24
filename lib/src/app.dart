import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/src/models/meals_model.dart';

import 'screens/filtersScreen.dart';
import 'screens/mealsScreen.dart';
import 'screens/tabsScreen.dart';
import 'screens/meal_detailScreen.dart';
import '../dummy_data.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegen': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  _saveFilters(Map<String, bool> filters) {
    setState(() {
      _filters = filters;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) return false;
        if (filters['lactose'] && !meal.isLactoseFree) return false;
        if (filters['vegen'] && !meal.isVegan) return false;
        if (filters['vegetarian'] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });

    print(_filters);
    print(_availableMeals[0].isGlutenFree);
    print(_availableMeals[0].isVegan);
  }

  _toggleFavourite(String mealId){
    var _index = _favouriteMeals.indexWhere((meal) => meal.id == mealId);

    if(_index == -1)
    setState(() {
      _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    });
    else{
      setState(() {
       _favouriteMeals.removeAt(_index);
      });
    }
  }

  bool _isFavouriteMeal(String mealId){
    return _favouriteMeals.any((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(225, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: TextStyle(
                fontSize: 20.0,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (ctx) => TabsScreen(_favouriteMeals),
        MealsScreen.routeName: (ctx) => MealsScreen(_availableMeals),
        MealDetails.routeName: (ctx) => MealDetails(_toggleFavourite,_isFavouriteMeal),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_saveFilters,_filters),
      },
    );
  }
}
