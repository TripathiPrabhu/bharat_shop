import 'package:bharat_shop/providers/Product_Provider.dart';
import 'package:bharat_shop/providers/productModel.dart';
import 'package:bharat_shop/screens/Product_Details_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductView extends StatefulWidget {


  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    final product =Provider.of<Product_Model>(context);

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
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.blueGrey,
                    )),
              ),
            ],
          ),
        ),

        //Tile footer goes here
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
          title: Text('${product.title}'),
          trailing: Text(
            '₹ ${product.price}',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),

        //Product Image goes here
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, ProductDetailScreen.routeName,
                arguments: '${product.id}');
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
