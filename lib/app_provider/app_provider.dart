import 'package:demo/app_provider/repositories/item_list.dart';
import 'package:demo/app_provider/screens/cart_screen.dart';
import 'package:demo/app_provider/screens/item_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Cart()), Provider(create: (context) => ItemList())],
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Provider Example',
          initialRoute: '/',
          routes: {'/': (context) => const ItemScreen(), '/cart': (context) => const CartScreen()},
        );
      },
    );
  }
}
