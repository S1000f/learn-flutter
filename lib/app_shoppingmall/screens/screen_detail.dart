import 'package:flutter/material.dart';

import '../models/model_item.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Text(
              item.title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${item.price} won',
                      style: const TextStyle(fontSize: 18, color: Colors.pink),
                    ),
                    Text(
                      'Brand : ${item.brand}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Register Date : ${item.registerDate}',
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: const [
                      Icon(
                        Icons.add,
                        color: Colors.lightBlue,
                      ),
                      Text(
                        'Add',
                        style: TextStyle(color: Colors.lightBlue),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Text(
              item.description,
              style: const TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
