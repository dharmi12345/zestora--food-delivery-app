import 'package:flutter/material.dart';
import '../view/foodmodelscreen.dart';

class CartProvider extends ChangeNotifier {
  final List<Food> _cart = [];

  List<Food> get cart => _cart;

  void addItem(Food food) {
    int index = _cart.indexWhere((item) => item.name == food.name);

    if (index >= 0) {
      _cart[index].quantity++;
    } else {
      _cart.add(food);
    }

    notifyListeners();
  }

  void removeItem(Food food) {
    _cart.remove(food);
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;

    for (var item in _cart) {
      total += item.price * item.quantity;
    }

    return total;
  }

  int get itemCount => _cart.length;
}
