import 'package:flutter/material.dart';
import 'category_cart.dart';

class Category extends StatelessWidget {
  const Category({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView(
        children: [
          CategoryCard(
            icon: Icon(Icons.book,size: 40), 
            name: 'Books'
          ),
          CategoryCard(
            icon: Icon(Icons.computer, size: 40), 
            name: 'Laptops'
          ),
          CategoryCard(
            icon: Icon(Icons.videogame_asset,size: 40), 
            name: 'Games'
          ),
          CategoryCard(
            icon: Icon(Icons.videocam,size: 40), 
            name: 'Movies'
          ),
          CategoryCard(
            icon: Icon(Icons.watch,size: 40), 
            name: 'Watches'
          ),
          CategoryCard(
            icon: Icon(Icons.weekend,size: 40), 
            name: 'Furniture'
          ),
        ],
      ),
    );
  }
}