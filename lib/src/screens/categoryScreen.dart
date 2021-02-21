import 'package:flutter/material.dart';

import '../widgets/categoryGrid.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      body: CategoryGrid(),
    );
  }
}