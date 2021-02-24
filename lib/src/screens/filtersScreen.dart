import 'package:flutter/material.dart';
import 'package:meals_app/src/widgets/mainDrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function _saveFilters;

  final Map<String,bool> _currentFilters;

  FiltersScreen(this._saveFilters,this._currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenFree = false;
  var isVegan = false;
  var isVegetarian = false;
  var isLactoseFree = false;

  @override
  void initState() {
    isGlutenFree = widget._currentFilters['gluten'];
    isLactoseFree = widget._currentFilters['lactose'];
    isVegan = widget._currentFilters['vegen'];
    isVegetarian = widget._currentFilters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save_rounded),
            onPressed: () {
              var updatedFilters = {
                'gluten': isGlutenFree,
                'lactose': isLactoseFree,
                'vegen': isVegan,
                'vegetarian': isVegetarian,
              };
              widget._saveFilters(updatedFilters);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Text(
              'Adjust your meals filters',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitch('Gluten-Free', 'Only including gluten-free meals',
                  isGlutenFree, (newVal) {
                setState(() {
                  isGlutenFree = newVal;
                });
              }),
              buildSwitch('Lactose-Free', 'Only including lactose-free meals',
                  isLactoseFree, (newVal) {
                setState(() {
                  isLactoseFree = newVal;
                });
              }),
              buildSwitch('Vegan', 'Only including vegan meals', isVegan,
                  (newVal) {
                setState(() {
                  isVegan = newVal;
                });
              }),
              buildSwitch(
                  'Vegetarian', 'Only including vegetarian meals', isVegetarian,
                  (newVal) {
                setState(() {
                  isVegetarian = newVal;
                });
              }),
            ],
          )),
        ],
      ),
    );
  }

  Widget buildSwitch(String title, String description, bool currentValue,
      Function stateHandler) {
    return SwitchListTile(
      value: currentValue,
      onChanged: stateHandler,
      title: Text(title),
      subtitle: Text(description),
    );
  }
}
