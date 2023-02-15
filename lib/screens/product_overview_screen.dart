import 'package:flutter/material.dart';
import '../widgets/Product_Grid_View.dart';

class ProductOverViewScreen extends StatelessWidget {
  const ProductOverViewScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Bharat-Shop'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: IconButton(onPressed: (){},
                icon: const Icon(Icons.shopping_cart,size: 30,)),
            )],
        ),
        body: const Product_Grid_View()
      ),
    );
  }
}
