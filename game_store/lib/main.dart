import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart'; // <-- add this import
import 'firebase_options.dart';
import 'views/home_page.dart';
import 'views/news_page.dart';
import 'views/register_page.dart';
import 'views/signin_page.dart';
import 'views/profile.dart';
import 'views/cart_page.dart';
import 'views/library_page.dart';
import 'models/cart_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(create: (_) => CartProvider(), child: const MyApp()),
  );
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
        '/profile': (context) => ProfilePage(),
        '/register': (context) => RegisterPage(),
        '/signin': (context) => SignInPage(),
        '/cart': (context) => CartPage(),
        '/library': (context) => LibraryPage(),
      },
    );
  }
}
