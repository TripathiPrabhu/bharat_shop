import 'package:bharat_shop/providers/Products.dart';
import 'package:bharat_shop/providers/cart_Provider.dart';
import 'package:bharat_shop/providers/order_items.dart';
import 'package:bharat_shop/screens/Product_Details_Screen.dart';
import 'package:bharat_shop/screens/cart_screen.dart';
import 'package:bharat_shop/screens/product_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (ctx)=> Product_Provider()),
          ChangeNotifierProvider(
              create: (ctx)=>Cart_Provider()),
          ChangeNotifierProvider(
              create: (ctx)=> Order_Provider()),
        ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          primarySwatch: Colors.indigo
        ),
       home:  ProductOverViewScreen(),

        routes: {
          ProductDetailScreen.routeName : (context)=> ProductDetailScreen(),
          ProductOverViewScreen.routeName : (context)=> ProductOverViewScreen(),
          CartScreen.routeName : (context)=> CartScreen(),


        },
      ),
    );
  }
}
