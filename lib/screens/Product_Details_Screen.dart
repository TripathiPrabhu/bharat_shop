import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;
  bool isFavourite = false;

  ProductDetailScreen(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      required this.isFavourite});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title!),
      ),
    ));
  }
}
