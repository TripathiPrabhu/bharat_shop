import 'package:bharat_shop/providers/Products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget with ChangeNotifier{
  static const routeName = '/ProductDetailScreen';

   ProductDetailScreen({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final aproduct = Provider.of<Product_Provider>(context, listen: false);
    final loadedProduct =aproduct.findById(productId);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('${loadedProduct.title}'),
          ),
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.width / 3 + 50,
                width: double.maxFinite,
                color: Colors.red,
               
                child: ChangeNotifierProvider.value(

                value: aproduct,

                child: Image.network(
                  '${loadedProduct.imageUrl}',
                  fit: BoxFit.contain,
                ),
),
),
              
              Text('title: ${loadedProduct.title.toString()}'),
              Text('id: ${loadedProduct.id.toString()}'),
              Text('price: ${loadedProduct.price.toString()}'),
            ],
          )),
    );
  }
}
