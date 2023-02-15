import 'package:flutter/material.dart';

class Product_Model{
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;

  bool isFavourite = false;


  Product_Model(
      { @required this.id,
        @required this.title,
        @required this.description,
        @required this.imageUrl,
        @required this.price,
        required this.isFavourite});



}