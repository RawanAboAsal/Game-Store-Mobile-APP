import 'package:flutter/foundation.dart';
import '../models/game.dart';

class CartProvider extends ChangeNotifier {
  final List<Game> _cartItems = [];
  final List<Game> _purchasedGames = [];

  List<Game> get cartItems => List.unmodifiable(_cartItems);
  List<Game> get purchasedGames => List.unmodifiable(_purchasedGames);

  void addToCart(Game game) {
    _cartItems.add(game);
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

  void checkout() {
    _purchasedGames.addAll(_cartItems);
    clearCart();
    notifyListeners();
  }
}
