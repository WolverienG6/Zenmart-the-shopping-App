import 'package:flutter/material.dart';

import 'all_products.dart';
import 'category.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          Center(child: Text('Category', style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),)),
          SizedBox(height: 10,),
          Category(),
          Center(child: Text('Products', style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),), ),
          AllProducts(),
        ],
      );
  }
}