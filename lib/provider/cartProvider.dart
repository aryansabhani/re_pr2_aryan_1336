import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List cartItems = [];

  addCartItem({required var cartItem}) {
    cartItems.add(cartItem);
    notifyListeners();
  }
}
