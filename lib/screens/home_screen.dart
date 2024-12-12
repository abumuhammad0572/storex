import 'package:flutter/material.dart';
import 'package:storex/screens/book_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StoreX'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookListScreen()),
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
