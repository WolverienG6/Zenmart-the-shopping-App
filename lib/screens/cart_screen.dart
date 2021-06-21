import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zenmart/models/cart.dart';
import 'package:zenmart/models/orders.dart';
import 'package:zenmart/widgets/card_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(fontSize: 30, color: Theme.of(context).primaryColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (ctx, i) => CartPdt(
                      id: cart.items.values.toList()[i].id,
                      productid: cart.items.keys.toList()[i],
                      name: cart.items.values.toList()[i].name,
                      quantity: cart.items.values.toList()[i].quantity,
                      price: cart.items.values.toList()[i].price))),
          CheckOutButton(cart: cart),
        ],
      ),
    );
  }
}

class CheckOutButton extends StatefulWidget {
  final Cart cart;
  const CheckOutButton({required this.cart});

  @override
  _CheckOutButtonState createState() => _CheckOutButtonState();
}

class _CheckOutButtonState extends State<CheckOutButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.cart.totalAmount <= 0
          ? null
          : () async {
              await Provider.of<Orders>(context, listen: false).addOrder(
                  widget.cart.items.values.toList(), widget.cart.totalAmount);
              widget.cart.clear();
            },
      child:
          Text('CheckOut', style: TextStyle(color: Colors.blue, fontSize: 20)),
    );
  }
}
