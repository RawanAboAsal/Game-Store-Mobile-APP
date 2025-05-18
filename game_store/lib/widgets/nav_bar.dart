import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: Colors.grey[900],
      child: Row(
        children: [
          Text(
            'Game Store',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 32),

          // ✅ Nav buttons with named routes
          NavItem(title: 'Home', route: '/'),
          NavItem(title: 'News', route: '/news'),
          NavItem(title: 'Profile', route: '/profile'),

          Spacer(),

          // ✅ Sign In & Sign Up buttons
          TextButton(
            onPressed: () {
              // TODO: Navigate or show login dialog
            },
            child: Text("Sign In", style: TextStyle(color: Colors.white)),
          ),
          SizedBox(width: 10),
          OutlinedButton(
            onPressed: () {
              // TODO: Navigate or show signup dialog
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.white),
            ),
            child: Text("Sign Up", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  final String route;

  const NavItem({required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, route),
        child: Text(title, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
