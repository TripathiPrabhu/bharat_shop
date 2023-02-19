import 'package:bharat_shop/providers/Products.dart';
import 'package:bharat_shop/providers/Product.dart';
import 'package:bharat_shop/screens/Product_Details_Screen.dart';
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
        ChangeNotifierProvider(create: (ctx)=> Product_Provider(),),
        ChangeNotifierProvider(create: (ctx)=> Product(),),
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


        },
      ),
    );
  }
}
