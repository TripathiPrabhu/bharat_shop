import 'package:bharat_shop/providers/Product.dart';
import 'package:bharat_shop/providers/cart_Provider.dart';
import 'package:bharat_shop/screens/Product_Details_Screen.dart';
import 'package:bharat_shop/widgets/product_increase_decrease.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart_Provider>(context, listen: false);
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
                    onPressed: () {
                      setState(() {
                        product.togglefavStatus();
                      });

                    },
                    icon: product.isFavourite! ? Icon(
                      Icons.favorite, color: Colors.yellow,) :
                    Icon(Icons.favorite_border, color: Colors.deepPurple,)
                ),
              ),
            ],
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading:
          //cart.item.isNotEmpty?IncreaseDecrease():
          ElevatedButton(
            onPressed: () {cart.addItem(product.id!, product.title!, product.price!);},
            child:
            Text('Add to Cart'),),
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
