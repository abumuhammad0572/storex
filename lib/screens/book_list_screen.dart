import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storex/models/book.dart';
import 'package:storex/providers/cart_provider.dart';
import 'package:storex/screens/book_detail_screen.dart';

class BookListScreen extends StatelessWidget {
  final List<Book> books = [
    Book(
      id: "1",
      title: "Коран",
      author: "Порохова",
      description: "Основная книга ислама.",
      price: 0.0,
      image: "assets/images/quran.png",
    ),
    Book(
      id: "2",
      title: "Тафсир",
      author: "ас-Сади",
      description: "Тафсир Корана в трех томах.",
      price: 10.99,
      image: "assets/images/tafseer.png",
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
        itemBuilder: (ctx, i) {
          final book = books[i];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Image.asset(book.image),
              title: Text(book.title),
              subtitle: Text('Автор: ${book.author}'),
              trailing: IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  cartProvider.addItem(book); // Передаём объект Book
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${book.title} добавлен в корзину'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          BookDetailScreen(book: book),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin = const Offset(1.0, 0.0);
                        var end = Offset.zero;
                        var curve = Curves.ease;
                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      }),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
