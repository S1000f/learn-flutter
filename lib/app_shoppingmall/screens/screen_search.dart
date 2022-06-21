import 'package:demo/app_shoppingmall/models/model_query.dart';
import 'package:demo/app_shoppingmall/providers/provider_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);
    final searchQuery = Provider.of<SearchQuery>(context);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            TextField(
              onChanged: (text) => searchQuery.updateText(text),
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'input string to search',
                border: InputBorder.none,
              ),
              minLines: 1,
              cursorColor: Colors.grey,
              cursorWidth: 1.5,
            )
          ],
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () => itemProvider.search(searchQuery.text),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: GridView.builder(
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1 / 1.5),
                  itemCount: itemProvider.searchItems.length,
                  itemBuilder: (context, index) => GridTile(
                          child: InkWell(
                        onTap: () =>
                            Navigator.of(context).pushNamed('/detail', arguments: itemProvider.searchItems[index]),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                itemProvider.searchItems[index].title,
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text('${itemProvider.searchItems[index].price} won',
                                  style: const TextStyle(fontSize: 16, color: Colors.pink))
                            ],
                          ),
                        ),
                      ))))
        ],
      ),
    );
  }
}
