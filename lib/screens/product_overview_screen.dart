import 'package:bharat_shop/providers/Products.dart';
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
    final product = Provider.of<Product_Provider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Bharat-Shop'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart,
                      size: 30,
                    )),
              ),
              PopupMenuButton(
                  onSelected: (filterOption selectedValue){
                    if(selectedValue == filterOption.favorite){
                          product.showFavoriteOnly();
                    }
                    else{
                          product.showall();
                    }
                  },
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (_) => [
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
