import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;

  bool? isFavourite;


  Product(
      { this.id,
        this.title,
        this.description,
        this.imageUrl,
        this.price,
        this.isFavourite});

    void togglefavStatus(){
      isFavourite = !isFavourite!;
      notifyListeners();
    }

}