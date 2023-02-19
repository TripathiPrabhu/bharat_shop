import 'package:flutter/material.dart';

class CartItem {
  final String? productId;
  final String? title;
  final double? price;
  final int? quantity;

  CartItem({
    @required this.productId,
    @required this.title,
    @required this.price,
    @required this.quantity,
  });
}

class Cart_Provider with ChangeNotifier {
  late Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, CartItem) {
        total += (CartItem.price! * CartItem.quantity!);
    });

    return total;


  }

  addCartItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              productId: existingCartItem.productId,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity! + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
                productId: DateTime.now().toString(),
                title: title,
                price: price,
              ));
      notifyListeners();
    }
  }
}
