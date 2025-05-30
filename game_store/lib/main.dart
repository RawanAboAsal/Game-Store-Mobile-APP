import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart'; // <-- Firebase Auth
import 'package:provider/provider.dart';
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
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const MyApp(),
    ),
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
      home: AuthGate(), // <--- dynamic start screen
      routes: {
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

class AuthGate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(), // Listen to login state
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          return HomePage(); // Logged-in user goes to home
        } else {
          return SignInPage(); // Not logged-in goes to sign-in
        }
      },
    );
  }
}
