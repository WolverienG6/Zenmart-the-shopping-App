import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zenmart/models/cart.dart';
import 'package:zenmart/models/products.dart';
import 'package:zenmart/screens/pdt_detail_screen.dart';

class PdtItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const PdtItem({Key? key, required this.name, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pdt = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailPage.routeName, arguments: pdt.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridTile(
          child: Image.network(imageUrl),
          footer: GridTileBar(
            title: Text(name),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addItem(pdt.id, pdt.name, pdt.price);
              },
            ),
            backgroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
