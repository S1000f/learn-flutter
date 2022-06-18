import 'package:demo/app_provider/models/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);
    final List<Item> items = cart.items;

    return Scaffold(
        appBar: AppBar(
          title: const Text('My Cart'),
          actions: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Total cost : ${cart.getTotalPrice()}',
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Builder(builder: (context) {
                return ListTile(
                  title: Text(items[index].title),
                  subtitle: Text(items[index].price.toString()),
                  trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        cart.deleteItem(items[index].id);
                      }),
                );
              });
            }));
  }
}
