import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storex/providers/cart_provider.dart';
import '../models/book.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  const BookDetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Image.asset(
              book.imageUrl,
              height: 200,
            )),
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
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                cartProvider.addItem(book);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Товар добавлен в корзину!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Добавить в корзину'),
            ),
          ],
        ),
      ),
    );
  }
}
