import 'package:flutter/foundation.dart';
import '../../../model/product.dart';

class CartItem {
  final ProductModel product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartManager extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  // Tính tổng giá tiền của tất cả sản phẩm trong giỏ hàng
  double get totalAmount {
    double total = 0.0;
    for (var item in _items) {
      total += (item.product.price ?? 0.0) * item.quantity;
    }
    return total;
  }

  void addItem(ProductModel product) {
    int index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeItem(ProductModel product) {
    _items.removeWhere((item) => item.product.id == product.id);
    notifyListeners();
  }

  void updateQuantity(ProductModel product, int quantity) {
    int index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _items[index].quantity = quantity;
      notifyListeners();
    }
  }
}