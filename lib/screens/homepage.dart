import 'package:flutter/material.dart';
import 'package:zenmart/widgets/homebody.dart';

import 'cart_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Zenmart'),
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart,size: 30,), onPressed: () => Navigator.of(context).pushNamed(CartScreen.routeName))
        ],
      ),
      body: HomeBody(),
    );
  }
}
