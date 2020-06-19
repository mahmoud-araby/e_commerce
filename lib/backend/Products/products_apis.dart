import 'dart:convert';

import 'package:http/http.dart' as http;

import './Products.dart';
import '../../config.dart';

enum Error {
  NetworkConnectionError,
  AuthenticationError,
  NOError,
  CouldNotComplete,
}

mixin ProductsApis {
  Error error = Error.NOError;

  Future<List<Product>> fetchAll() async {
    List<Product> products = [];
    http.Response response = await http.get(ProductsLink);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> data = jsonDecode(response.body);
      for (Map index in data) {
        print(index);
        products.add(Product.fromJson(index));
      }
    } else {
      error = Error.CouldNotComplete;
    }

    return products;
  }
}
