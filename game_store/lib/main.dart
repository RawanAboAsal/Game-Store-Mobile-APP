import 'package:flutter/material.dart';
import 'views/home_page.dart';
import 'views/news_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Games Store',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/news': (context) => NewsPage(),
        '/profile':
            (context) => Scaffold(
              appBar: AppBar(title: Text('Profile')),
              body: Center(
                child: Text('User Profile', style: TextStyle(fontSize: 18)),
              ),
            ),
      },
    );
  }
}
