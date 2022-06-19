import 'package:flutter/material.dart';

import '../models/book.dart';

class DetailScreen extends StatelessWidget {
  late final String title;
  late final String subtitle;
  late final String description;
  late final String image;

  DetailScreen({required this.title, required this.subtitle, required this.description, required this.image});

  DetailScreen.book(Book book) {
    title = book.title;
    subtitle = book.subtitle;
    description = book.description;
    image = book.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: [
            Image.network(image),
            const Padding(padding: EdgeInsets.all(3)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          title,
                          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  padding: const EdgeInsets.all(10),
                  child: const Center(
                    child: Icon(
                      Icons.star,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: const [
                    Icon(
                      Icons.call,
                      color: Colors.indigo,
                    ),
                    Text(
                      'Contact',
                      style: TextStyle(color: Colors.indigo),
                    )
                  ],
                ),
                Column(
                  children: const [
                    Icon(
                      Icons.near_me,
                      color: Colors.indigo,
                    ),
                    Text(
                      'Route',
                      style: TextStyle(color: Colors.indigo),
                    )
                  ],
                ),
                Column(
                  children: const [
                    Icon(
                      Icons.save,
                      color: Colors.indigo,
                    ),
                    Text(
                      'Save',
                      style: TextStyle(color: Colors.indigo),
                    )
                  ],
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(description),
            )
          ],
        ));
  }
}
