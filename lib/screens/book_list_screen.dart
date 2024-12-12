import 'package:flutter/material.dart';
import 'package:storex/screens/book_detail_screen.dart';
import '../models/book.dart';

class BookListScreen extends StatelessWidget {
  final List<Book> books = [
    Book(
      title: 'Перевод Корана',
      author: 'Порохова',
      description: 'Основная книга ислама.',
      price: 8.0,
      imageUrl: 'assets/images/quran.png',
      category: 'Религиозные книги',
    ),
    Book(
      title: 'Тафсир',
      author: "ас-Са'ди",
      description: 'Сборник толкований Корана.',
      price: 10.99,
      imageUrl: 'assets/images/tafseer.png',
      category: 'Религиозные книги',
    ),
  ];

  BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Книги'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (ctx, i) => ListTile(
          leading: Image.asset(books[i].imageUrl),
          title: Text(books[i].title),
          subtitle: Text(books[i].author),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BookDetailScreen(book: books[i])),
            );
          },
        ),
      ),
    );
  }
}
