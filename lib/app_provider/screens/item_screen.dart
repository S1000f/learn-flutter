import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/item.dart';
import '../repositories/item_list.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);
    final ItemList itemList = Provider.of<ItemList>(context);

    List<Item> items = itemList.getItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed('/cart');
            },
          )
        ],
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Builder(
              builder: (context) {
                Item findItem = items[index];
                bool isInCart = cart.items.contains(findItem);
                return ListTile(
                  title: Text(findItem.title),
                  subtitle: Text(findItem.price.toString()),
                  trailing: isInCart
                      ? const Icon(Icons.check)
                      : IconButton(
                          onPressed: () {
                            cart.addItem(findItem);
                          },
                          icon: const Icon(Icons.add)),
                );
              },
            );
          }),
    );
  }
}
