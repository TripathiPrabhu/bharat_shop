import 'package:bharat_shop/providers/cart_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart_Provider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My-Cart',
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: double.maxFinite,
                height: 80,
                child: Flexible(
                  child: Row(
                    children: [
                      Text('Total'),
                      SizedBox(
                          height: 80,
                          width: 100,
                          child: Chip(label: Text('\$${cart.totalAmount}')))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
