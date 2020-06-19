import 'package:flutter/material.dart';

import 'Products/Products.dart';

class CartModel extends ChangeNotifier {
  List<Product> cartProducts = [];

  bool isInCart(String id) {
    bool ret = false;
    int index = cartProducts.indexWhere((element) => element.id == id);
    if (index < 0) {
      ret = false;
    } else {
      ret = true;
    }
    return ret;
  }

  toggleCartProduct(Product product) {
    int index = cartProducts.indexWhere((element) => element.id == product.id);
    if (index < 0) {
      cartProducts.add(product);
    } else {
      cartProducts.removeAt(index);
    }
    notifyListeners();
  }
}
