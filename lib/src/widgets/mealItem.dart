import 'package:flutter/material.dart';
import 'package:meals_app/src/screens/meal_detailScreen.dart';
import '../models/meals_model.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.imageUrl,
    @required this.title,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  gotoMealDetails(BuildContext ctx){
    Navigator.of(ctx).pushNamed(MealDetails.routeName,arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => gotoMealDetails(context),
      child: Card(
        margin: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4.0,
        child: Column(children: [
          Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: 250.0,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 20.0,
              right: 10.0,
              child: Container(
                color: Colors.black54,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.0,vertical: 6.0),
                  width: 300.0,
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    overflow: TextOverflow.fade,
                    softWrap: true,
                  ),
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
