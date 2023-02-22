import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_Provider.dart';
import '../providers/order_items.dart';

class CartItemList extends StatelessWidget {
  final String? id;
  final String? Productid;
  final String? title;
  final double? price;
  final int? quantity;

  CartItemList({
    this.id,
    this.Productid,
    this.title,
    this.price,
    this.quantity
}
      );


  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart_Provider>(context, listen: true);
    final order = Provider.of<Order_Provider>(context, listen: true);

    return Column(
      children: [
        Dismissible(
              direction: DismissDirection.endToStart,
              onDismissed: (direction){
                cart.deleteFromCart(Productid!);
              },
              key: ValueKey(Productid),

              background: Container(color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Icon(Icons.delete, size: 40,),
                ),alignment: Alignment.centerRight,),
              child: Card(
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    width: double.maxFinite,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Amount'),
                        Chip(label: Text('${quantity! * price!}'),),
                        Text('${title}'),
                        Chip(label: Text('Quantity: ${quantity}')),
                        Chip(label: Text('Price: ${price}')),

                      ],
                    ),
                  ),
                ),
              ),

        ),

      ],
    );
  }
}
