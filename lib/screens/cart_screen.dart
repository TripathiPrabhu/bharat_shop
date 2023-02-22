import 'package:bharat_shop/providers/cart_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/Products.dart';
import '../providers/order_items.dart';
import '../widgets/cart_item_list.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart_Provider>(context, listen: true);
    final order = Provider.of<Order_Provider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My-Cart',
        ),
        centerTitle: true,
      ),
      body:  ListView.builder(
    itemCount: cart.item.length,
    itemBuilder: (BuildContext context, int index) {
      return Column(
        children: [
          CartItemList(
            id: cart.item.values.toList()[index].id,
            price: cart.item.values.toList()[index].price,
            title: cart.item.values.toList()[index].title,
              quantity: cart.item.values.toList()[index].quantity,
              Productid: cart.item.keys.toList()[index],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  onPressed: (){
                    order.addOrder(cart.item.values.toList(), cart.totalAmount);
                    cart.clearCart();
                  },
                  child: Text('Order Now')),
            ),
          )
        ],
      );

    }
    ),
    );
  }
}
