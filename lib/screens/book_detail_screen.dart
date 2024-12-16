import 'package:flutter/material.dart';
import '../models/book.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  const BookDetailScreen({Key? key, required this.book}) : super(key: key);

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
            Image.asset(book.image),
            SizedBox(height: 16),
            Text(
              book.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text("Автор: ${book.author}"),
            SizedBox(height: 16),
            Text(book.description),
            SizedBox(height: 16),
            Text("Цена: \$${book.price}"),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Добавление книги в корзину
              },
              child: Text("Добавить в корзину"),
            ),
          ],
        ),
      ),
    );
  }
}
