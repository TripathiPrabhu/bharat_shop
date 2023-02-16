import 'package:flutter/material.dart';

import 'productModel.dart';

class Product_Provider with ChangeNotifier {
  final List<Product_Model> _item = [
    Product_Model(
      id: '1',
      title: 'Grey Top Girls..',
      imageUrl:
          'https://images.unsplash.com/photo-1560535733-540e0b0068b9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      description: 'description',
      price: 199,
      isFavourite: false,
    ),
    Product_Model(
      id: '2',
      title: 'Green Top Girls..',
      imageUrl:
          'https://images.unsplash.com/photo-1495385794356-15371f348c31?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGdpcmwlMjBkcmVzc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      description: 'description',
      price: 299,
      isFavourite: false,
    ),
    Product_Model(
      id: '3',
      title: 'Pink Top Girls..',
      imageUrl:
          'https://images.unsplash.com/photo-1542295669297-4d352b042bca?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8Z2lybCUyMGRyZXNzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      description: 'description',
      price: 399,
      isFavourite: false,
    ),
    Product_Model(
      id: '4',
      title: 'Queen Red Baby',
      imageUrl:
          'https://images.unsplash.com/photo-1550928431-ee0ec6db30d3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGdpcmwlMjBkcmVzc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      description: 'description',
      price: 249,
      isFavourite: false,
    ),
  ];

  final List faveProductList = [];

  List<Product_Model> get item {
    return [..._item];
  }

  MakeFavorite (){

  }

    Product_Model findById(id){
    notifyListeners();
    return _item.firstWhere((prod) => prod.id ==id);

     }
  void addProduct() {
    // _item.add('value');
    notifyListeners();
  }
}
