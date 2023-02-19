import 'package:bharat_shop/providers/Products.dart';
import 'package:bharat_shop/widgets/ProductItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Product_Grid_View extends StatelessWidget {
  const Product_Grid_View({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product_Provider>(context,);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        itemCount: product.item.length,
        itemBuilder: (ctx, i) {
          return ChangeNotifierProvider.value(
            value: product.item[i],
            child: ProductItem(),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio:
              MediaQuery.of(context).size.width > 500 ? 1 : 2.3 / 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
        ),
      ),
    );
  }
}
