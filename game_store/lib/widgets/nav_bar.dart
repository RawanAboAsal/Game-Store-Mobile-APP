import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: Colors.grey[900],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
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
                SizedBox(width: 24),
                NavItem(title: 'Home', route: '/'),
                NavItem(title: 'News', route: '/news'),
                if (user != null) NavItem(title: 'Library', route: '/library'),
                if (user != null)
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    icon: Icon(Icons.person, color: Colors.white),
                    tooltip: 'Profile',
                  ),
                if (user == null)
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signin');
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                if (user == null)
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                    ),
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  final String route;

  const NavItem({required this.title, required this.route, Key? key})
    : super(key: key);

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
