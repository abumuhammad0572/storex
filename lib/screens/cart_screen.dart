import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storex/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Корзина")),
      body: ListView.builder(
        itemCount: cartProvider.items.length,
        itemBuilder: (ctx, i) {
          final book = cartProvider.items[i];
          return ListTile(
            title: Text(book.title),
            subtitle: Text("Цена: \$${book.price}"),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                cartProvider.removeItem(book.id);
              },
            ),
          );
        },
      ),
    );
  }
}
