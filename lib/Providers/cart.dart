import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String productId;
  final String title;
  final int quanitity;
  final double price;

  CartItem(
      {required this.id,
      required this.productId,
      required this.title,
      required this.quanitity,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, value) {
      total = total + value.price;
    });
    return total;
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          productId: existingCartItem.productId,
          title: existingCartItem.title,
          quanitity: existingCartItem.quanitity + 1,
          price: existingCartItem.price,
        ),
      );
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                productId: productId,
                title: title,
                price: price,
                quanitity: 1,
              ));
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
