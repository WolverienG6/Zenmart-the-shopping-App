import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Icon icon;
  final String name;

  const CategoryCard({Key? key, required this.icon, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.blueGrey
            )
          ],
        ),
        width: 100,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              icon,
              SizedBox(height: 10),
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
