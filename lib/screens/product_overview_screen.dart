import 'package:bharat_shop/providers/Products.dart';
import 'package:bharat_shop/providers/cart_Provider.dart';
import 'package:bharat_shop/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/Product_Grid_View.dart';

enum filterOption {
  favorite,
  all
}

class ProductOverViewScreen extends StatelessWidget {
  ProductOverViewScreen({Key? key}) : super(key: key);
  static const routeName = '/Product-Overview';

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product_Provider>(context, listen: false);
    final cart = Provider.of<Cart_Provider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Bharat-Shop'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(CartScreen.routeName) ;
                      },
                      icon: Icon(
                        Icons.shopping_cart_rounded, size: 35,
                        color: Colors.white,),),
                    Positioned(
                      top: 4,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(2.0),
                        decoration:
                        BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.deepPurple),
                        constraints: BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        child: Consumer<Cart_Provider>(
                          builder: (context, Cart_Provider, child) {
                            return Center(child: Text('${Cart_Provider.items.length}'));
                          },
                        ),
                      ),
                    ),
                  ],

                ),),


              PopupMenuButton(
                  onSelected: (filterOption selectedValue) {
                    if (selectedValue == filterOption.favorite) {
                      product.showFavoriteOnly();
                    }
                    else {
                      product.showall();
                    }
                  },
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (_) =>
                  [
                    PopupMenuItem(
                      child: Text('Show Favorite'),
                      value: filterOption.favorite,
                    ),
                    PopupMenuItem(
                      child: Text('Show all'),
                      value: filterOption.all,
                    ),


                  ]),
            ],
          ),
          body: Product_Grid_View()),
    );
  }
}
