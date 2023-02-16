import 'package:bharat_shop/providers/Product_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ProductView.dart';

class Product_Grid_View extends StatelessWidget {
  const Product_Grid_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsData =  Provider.of<Product_Provider>(context);
    final Products = ProductsData.item;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: MediaQuery.of(context).size.width>500?1:2.3/3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
        ),
        itemBuilder: (ctx, i) {
          return ChangeNotifierProvider(
            create: (BuildContext context) { Products[i]; },
            child: ProductView(),
          );
        },
        itemCount: Products.length,
      ),
    );
  }
}
