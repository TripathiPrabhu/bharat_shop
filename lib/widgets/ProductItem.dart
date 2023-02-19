import 'package:bharat_shop/providers/Product.dart';
import 'package:bharat_shop/screens/Product_Details_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        //favorite Icon Button goes here
        header: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Positioned(
                child: Consumer<Product>(
                  builder: (context, Product, child) {
                    return IconButton(
                        onPressed: () {
                          product.togglefavStatus();
                        },
                        icon: product.isFavourite! ? Icon(
                          Icons.favorite, color: Colors.yellow,) :
                        Icon(Icons.favorite_border, color: Colors.deepPurple,)
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        //Tile footer goes here
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, Product, child) {
              return IconButton(
                  onPressed: () {
                   // product.togglefavStatus();
                  },
                  icon: product.isFavourite! ? Icon(
                    Icons.shopping_cart_rounded, color: Colors.yellow,) :
                  Icon(Icons.shopping_cart_outlined, color: Colors.deepPurple,)
              );
            },
          ),
          title: Text('${product.title}'),
          trailing: Text(
            '₹ ${product.price}',
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),

        //Product Image goes here
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(
            '${product.imageUrl}',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}