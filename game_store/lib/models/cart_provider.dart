import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/game.dart';

class CartProvider extends ChangeNotifier {
  final List<Game> _cartItems = [];
  final List<Game> _purchasedGames = [];

  List<Game> get cartItems => List.unmodifiable(_cartItems);
  List<Game> get purchasedGames => List.unmodifiable(_purchasedGames);

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  void addToCart(Game game) {
    _cartItems.clear();  // Clear the cart first
    _cartItems.add(game); // Add the new item
    notifyListeners();
  }


  void removeFromCart(Game game) {
    _cartItems.remove(game);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  Future<void> checkout() async {
    final user = _auth.currentUser;
    if (user == null) return;

    for (var game in _cartItems) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('library')
          .doc(game.title) // You can use an ID if your game has one
          .set({
        'title': game.title,
        'imagePath': game.imagePath,
        'description': game.description,
        'fullDescription': game.fullDescription,
        'price': game.price,
        'releaseDate': game.releaseDate,
        'genre': game.genre,
        'developer': game.developer,
        'rating': game.rating,
      });
    }

    _purchasedGames.addAll(_cartItems);
    clearCart();
    notifyListeners();
  }

  Future<void> loadPurchasedGames() async {
    final user = _auth.currentUser;
    if (user == null) return;

    final snapshot = await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('library')
        .get();

    _purchasedGames.clear();

    for (var doc in snapshot.docs) {
      final data = doc.data();
      _purchasedGames.add(Game(
        title: data['title'],
        imagePath: data['imagePath'],
        description: data['description'],
        fullDescription: data['fullDescription'],
        price: data['price'],
        releaseDate: data['releaseDate'],
        genre: data['genre'],
        developer: data['developer'],
        rating: (data['rating'] as num).toDouble(),
      ));
    }

    notifyListeners();
  }
}
