import 'package:flutter/material.dart';
import '../model/cart_item.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(String name, String image, int price) {
    final index = _items.indexWhere((e) => e.name == name);

    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(name: name, image: image, price: price));
    }

    notifyListeners();
  }

  void increase(int index) {
    _items[index].quantity++;
    notifyListeners();
  }

  void decrease(int index) {
    if (_items[index].quantity > 1) {
      _items[index].quantity--;
    } else {
      _items.removeAt(index);
    }

    notifyListeners();
  }

  void remove(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;

    for (var item in _items) {
      total += item.total;
    }

    return total;
  }
}
