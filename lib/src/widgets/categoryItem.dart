import 'package:flutter/material.dart';
import 'package:meals_app/src/screens/mealsScreen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id,this.title, this.color);

  goto(BuildContext ctx){
    Navigator.of(ctx).pushNamed(MealsScreen.routeName ,arguments: {'id': id, 'title': title});  
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goto(context),
      child: Container(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color.withOpacity(0.7), color]),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
