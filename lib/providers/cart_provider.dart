import 'package:flutter/material.dart';
import 'package:storex/models/book.dart';

class CartProvider with ChangeNotifier {
// Список товаров в корзине
  final List<Book> _items = [];

// Получить товары в корзине
  List<Book> get items => _items;

// Добавить товар в корзину
  void addItem(Book book) {
    _items.add(book);
    // Уведомить виджеты, которые зависят от этого состояния
    notifyListeners();
  }

// Удалить товар из корзины
  void removeItem(String id) {
    _items.removeWhere((book) => book.id == id);
    notifyListeners();
  }

// Очистить корзину
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
