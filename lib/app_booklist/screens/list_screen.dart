import 'package:demo/app_booklist/repository/book_repository.dart';
import 'package:demo/app_booklist/screens/detail_screen.dart';
import 'package:flutter/material.dart';

import '../models/book.dart';

class ListScreen extends StatelessWidget {
  final List<Book> books = BookRepository().getAllBooks();

  ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Book list App'),
        ),
        body: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            return BookTile(book: books[index]);
          },
        ));
  }
}

@immutable
class BookTile extends StatelessWidget {
  final Book book;

  BookTile({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(book.title),
      leading: Image.network(book.image),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailScreen.book(book)));
      },
    );
  }
}
