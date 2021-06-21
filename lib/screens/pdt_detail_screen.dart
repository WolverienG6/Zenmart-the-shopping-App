import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zenmart/models/cart.dart';
import 'package:zenmart/models/products.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/product-detail';
  final double price;
  final String title;
  final String desc;
  final String img;

  DetailPage(
      {this.desc = "",
      this.img = "",
      this.price = 0,
      this.title = ""});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedPdt = Provider.of<Products>(context).findById(productId);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: Text(loadedPdt.name)),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.network(loadedPdt.imgUrl),
            ),
          ),
          Text(
            'Price: \$${loadedPdt.desc}',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(15),
              child: Text('${loadedPdt.desc}',
                  style: TextStyle(
                    fontSize: 20,
                  )))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cart.addItem(productId, loadedPdt.name, loadedPdt.price);
        },
        child: Icon(
          Icons.shopping_cart,
          size: 30,
        ),
      ),
    );
  }
}
