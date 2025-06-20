import 'package:flutter/material.dart';
import 'package:new_app/models/cart_item_model.dart';

class CartProvider with ChangeNotifier {
  final List<CartItemModel> _cartItems = [];

  List<CartItemModel> get cartItems => _cartItems;

  void addCartItems(CartItemModel cartItem) {
    _cartItems.add(cartItem);
    notifyListeners();
  }

  void removeCartItems(CartItemModel cartItem) {
    _cartItems.remove(cartItem);
    notifyListeners();
  }
}
