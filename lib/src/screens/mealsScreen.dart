import 'package:flutter/material.dart';
import 'package:meals_app/src/models/meals_model.dart';
import 'package:meals_app/src/widgets/mealItem.dart';

class MealsScreen extends StatefulWidget {
  static const routeName = 'meals';

  final List<Meal> _availableMeals;
  

  MealsScreen(this._availableMeals);

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var flag = false;



  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!flag) {
      final arguments =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = arguments['id'];
      categoryTitle = arguments['title'];
      displayedMeals = widget._availableMeals
          .where((meals) => meals.categories.contains(categoryId))
          .toList();
    }
  }

  _removeId(String mealId){
    setState(() {
    displayedMeals.removeWhere((meal) => meal.id == mealId);  
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: displayedMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
          );
        },
      ),
    );
  }
}
