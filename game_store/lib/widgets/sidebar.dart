import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int selectedIndex = 0;

  void _onDestinationSelected(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushNamed(context, '/'); // Home
    } else if (index == 1) {
      Navigator.pushNamed(context, '/cart'); // Cart page route
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      backgroundColor: Colors.grey[900],
      selectedIndex: selectedIndex,
      onDestinationSelected: _onDestinationSelected,
      selectedIconTheme: IconThemeData(color: Colors.white),
      destinations: [
        NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
        NavigationRailDestination(
          icon: Icon(Icons.shopping_cart),
          label: Text('Cart'),
        ),
      ],
    );
  }
}
