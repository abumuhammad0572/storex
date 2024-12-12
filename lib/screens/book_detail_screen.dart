import 'package:flutter/material.dart';
import '../models/book.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  const BookDetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(book.imageUrl),
            const SizedBox(height: 16),
            Text(
              book.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Автор: ${book.author}'),
            const SizedBox(height: 16),
            Text(book.description),
            const SizedBox(height: 16),
            Text('Цена: \$${book.price.toString()}'),
          ],
        ),
      ),
    );
  }
}
