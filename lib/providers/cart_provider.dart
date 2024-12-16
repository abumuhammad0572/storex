import 'package:flutter/material.dart';
import '../models/book.dart'; // Импортируйте модель

class CartProvider with ChangeNotifier {
  final List<Book> _items = []; // Храним объекты типа Book

  List<Book> get items => _items;

  void addItem(Book book) {
    if (!_items.any((item) => item.id == book.id)) {
      _items.add(book);
      notifyListeners();
    }
  }

  void removeItem(String bookId) {
    _items.removeWhere((item) => item.id == bookId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
