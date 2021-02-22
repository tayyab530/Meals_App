import 'package:flutter/material.dart';

import '../screens/filtersScreen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            height: 100.0,
            width: double.infinity,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 26.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            padding: EdgeInsets.all(15.0),
          ),
          SizedBox(height: 20.0),
          buildListTile('Meals', Icons.restaurant_rounded,() => Navigator.of(context).pushNamed('/')),
          buildListTile('Filters', Icons.settings_rounded,() => Navigator.of(context).pushNamed(FiltersScreen.routeName))
        ],
      ),
    );
  }

  Widget buildListTile(String title, IconData icon, Function tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26.0,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      onTap: tabHandler,
    );
  }
}
