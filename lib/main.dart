import 'package:flutter/material.dart';
import 'package:zenmart/models/orders.dart';
import 'package:zenmart/screens/pdt_detail_screen.dart';
import 'models/cart.dart';
import 'screens/homepage.dart';
import 'models/products.dart';
import 'package:provider/provider.dart';
import 'screens/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Zenmart",
        theme: ThemeData(
          primaryColor: Colors.teal,
        ),
        home: HomePage(),
        routes: {
          DetailPage.routeName: (ctx)=>DetailPage(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
