import 'package:flutter/cupertino.dart';

import './Products/Products.dart';
import './Products/products_apis.dart';

class ProductModel extends ChangeNotifier with ProductsApis {
  bool isBusy = false;

  ProductModel() {
    fetchAllProducts();
    isBusy = false;
    notifyListeners();
  }

  List<Product> products = [];

  Future<void> fetchAllProducts() async {
    isBusy = true;
    notifyListeners();
    products = await fetchAll();
    isBusy = false;
    notifyListeners();
  }

  Product getProduct(int index) {
    return products[index];
  }

  Product getProductByID(String id) {
    return products.firstWhere((element) => element.id == id);
  }
}
