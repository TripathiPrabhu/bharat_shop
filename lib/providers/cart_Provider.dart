import 'package:flutter/material.dart';

  class CartItem{
    final String? id;
    final String? title;
    final double? price;
    final dynamic? quantity;

    CartItem( {
      required this.id, required this.title, required this.price, required this.quantity,
  });
  }

  class Cart_Provider with ChangeNotifier{
    Map<String, CartItem> _item = {};

    Map<String, CartItem> get item {
      return {..._item};
    }
    int get itemCount{
      return _item.length;
    }

    double get totalAmount{
      var total =0.0;
      _item.forEach((key, CartItem) {
        total += (CartItem.price! * CartItem.quantity);
      });

      return total;
    }

    int? get quantity {
      int quantity =0;
      _item.forEach((key, CartItem) {
        quantity = (CartItem.quantity+1)!;
      });
      return quantity ;
    }


    void addItem(String ProductId, String title, double price){
        if(_item.containsKey(ProductId)){
          //quantity increase
          _item.update(ProductId, (existingCartItem) =>
              CartItem(id: existingCartItem.id,
                  title: existingCartItem.title,
                  price: existingCartItem.price,
                  quantity: existingCartItem.quantity!+1));
        }
        else{
          _item.putIfAbsent(ProductId, () => CartItem(id:DateTime.now().toString(),
              title: title, price: price,
              quantity: 1));
        }
        notifyListeners();
    }

    void deleteFromCart(String id){
      _item.remove(id);
      notifyListeners();
    }

    void clearCart(){
      _item ={};
      notifyListeners();
    }

  }