import 'package:flutter/material.dart';
import 'package:meals_app/src/widgets/mainDrawer.dart';

import 'categoryScreen.dart';
import 'fovouriteScreen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> tabs = [
    {
      'pages': CategoryScreen(),
      'title': 'Categories',
    },
    {'pages': FavouriteScreen(), 'title': 'Your Favourite'}
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(tabs[_selectedIndex]['title']),
      ),
      body: tabs[_selectedIndex]['pages'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category_rounded),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.favorite_rounded),
            label: 'Favourites',
          ),
        ],
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }

  _selectTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

// Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('TabsScreen'),
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.category_rounded),
//                 child: Text('Categories'),
//               ),
//               Tab(
//                 icon: Icon(Icons.favorite_rounded),
//                 child: Text('Favourites'),
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(children: [
//           CategoryScreen(),
//           FavouriteScreen(),
//         ]),
//       ),
//     );
//   }
