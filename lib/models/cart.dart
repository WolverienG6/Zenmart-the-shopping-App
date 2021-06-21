import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String name;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String pdtid, String name, double price) {
    if (_items.containsKey(pdtid)) {
      _items.update(
          pdtid,
          (existingCardItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCardItem.name,
              quantity: existingCardItem.quantity + 1,
              price: existingCardItem.price));
    } else {
      _items.putIfAbsent(
          pdtid,
          () => CartItem(
              id: DateTime.now().toString(),
              name: name,
              quantity: 1,
              price: price));
    }

    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }

    if (_items[id]!.quantity > 1) {
      _items.update(
          id,
          (existingCardItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCardItem.name,
              quantity: existingCardItem.quantity - 1,
              price: existingCardItem.price));
    } else {
      _items.remove(id);
    }

    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });

    return total;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
