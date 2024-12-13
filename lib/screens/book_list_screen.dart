import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storex/providers/cart_provider.dart';
import 'package:storex/screens/book_detail_screen.dart';
import '../models/book.dart';

class BookListScreen extends StatelessWidget {
  final List<Book> books = [
    Book(
      id: '1',
      title: 'Перевод Корана',
      author: 'Порохова',
      description: 'Основная книга ислама.',
      price: 8.0,
      imageUrl: 'assets/images/quran.png',
      category: 'Религиозные книги',
    ),
    Book(
      id: '2',
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
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Книги'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (ctx, i) => Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            leading: Image.asset(books[i].imageUrl),
            title: Text(books[i].title),
            subtitle: Text('Автор: ${books[i].author}'),
            trailing: IconButton(
              onPressed: () {
                cartProvider.addItem(books[i]);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${books[i].title} добавлен в корзину'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              icon: const Icon(Icons.add_shopping_cart),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BookDetailScreen(book: books[i])),
              );
            },
          ),
        ),
      ),
    );
  }
}
