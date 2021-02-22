import 'package:flutter/material.dart';

import 'screens/filtersScreen.dart';
import 'screens/mealsScreen.dart';
import 'screens/tabsScreen.dart';
import 'screens/meal_detailScreen.dart';

class App extends StatelessWidget {
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
        '/' : (ctx) => TabsScreen(),
        MealsScreen.routeName : (ctx) => MealsScreen(),
        MealDetails.routeName : (ctx) => MealDetails(),
        FiltersScreen.routeName : (ctx) => FiltersScreen(),
      },
    );
  }

  // Route route(RouteSettings settings) {
  //   return MaterialPageRoute(
  //     // ignore: missing_return
  //     builder: (_) {
  //       if(settings.name == '/')
  //         return App();
  //       else if(settings.name == '/meals')
  //         return MealsScreen();
  //     },
  //   );
  // }
}
