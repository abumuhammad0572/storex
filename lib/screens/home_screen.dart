import 'package:flutter/material.dart';
import 'package:storex/screens/book_list_screen.dart';
import 'package:storex/screens/cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StoreX'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/cart',
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(child: Image.asset('assets/images/logo.png')),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/books',
                );
              },
              child: const Text('Список книг'),
            ),
          ],
        ),
      ),
    );
  }
}
