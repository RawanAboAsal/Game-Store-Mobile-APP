import 'package:flutter/material.dart';
import 'views/home_page.dart';
import 'views/news_page.dart';
import 'views/register_page.dart';
import 'views/signin_page.dart';
import 'views/profile.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/profile':(context) => ProfilePage(),
        '/register': (context) => RegisterPage(),
        '/signin': (context) => SignInPage(),
      },
    );
  }
}
