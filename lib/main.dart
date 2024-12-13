import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storex/providers/cart_provider.dart';
import 'package:storex/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'StoreX',
      home: HomeScreen(),
    );
  }
}
