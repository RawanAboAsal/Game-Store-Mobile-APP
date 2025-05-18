import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      backgroundColor: Colors.grey[900],
      selectedIconTheme: IconThemeData(color: Colors.white),
      destinations: [
        NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
        NavigationRailDestination(
          icon: Icon(Icons.shopping_cart),
          label: Text('Store'),
        ),
      ],
      selectedIndex: 0,
    );
  }
}
