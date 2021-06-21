import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zenmart/models/cart.dart';

class CartPdt extends StatelessWidget {
  final String id;
  final String productid;
  final double price;
  final int quantity;
  final String name;

  const CartPdt(
      {required this.id,
      required this.productid,
      required this.price,
      required this.quantity,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context).removeItem(productid);
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(
              child: Text('\$$price'),
            ),
          ),
          title: Text(name),
          subtitle: Text('Total: \$${(price * quantity)}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
