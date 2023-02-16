import 'package:bharat_shop/providers/Product_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/Product-Detail';



  @override
  Widget build(BuildContext context) {

    final ProductId = ModalRoute.of(context)?.settings.arguments as String;


    final loadedProduct = Provider.of<Product_Provider>(context, listen: false).findById(ProductId);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text('${loadedProduct.title}'),
      ),
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.width/3+50,
                width: double.maxFinite,
                color: Colors.red,
                child: Image.network('${loadedProduct.imageUrl}', fit: BoxFit.contain,),
              )
            ],
          ),

    ));
  }
}
