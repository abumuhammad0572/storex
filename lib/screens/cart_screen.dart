import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storex/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем доступ к провайдеру
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Корзина')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.items.length,
              itemBuilder: (ctx, i) => ListTile(
                title: Text(cartProvider.items[i].title),
                subtitle: Text('Цена: \$${cartProvider.items[i].price}'),
                trailing: IconButton(
                    onPressed: () {
                      cartProvider.removeItem(cartProvider.items[i].id);
                    },
                    icon: const Icon(Icons.delete)),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: cartProvider.clearCart,
            child: const Text('Очистить корзину'),
          ),
        ],
      ),
    );
  }
}
