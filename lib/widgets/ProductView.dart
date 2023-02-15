import 'package:bharat_shop/screens/Product_Details_Screen.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;
  bool isFavourite;

  ProductView(this.isFavourite,this.imageUrl, this.title, this.price,  this.id,
      this.description, {super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailScreen(
            id: widget.id,
            title: widget.title,
            description: widget.description,
            price: widget.price,
            imageUrl:widget.description,

          isFavourite:widget.isFavourite,)));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
          header: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Stack(alignment: AlignmentDirectional.topEnd, children: [
              Positioned(
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.blueGrey,
                    )),
              ),
            ],),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(onPressed: () {  },
              icon: const Icon(Icons.shopping_cart),),
            title: Text(widget.title!),
            trailing: Text(
              '₹ ${widget.price}',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          child: Image.network(
            widget.imageUrl!,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
