import 'package:Login/Screens/cart_page.dart';
import 'package:Login/Screens/login.dart';
import 'package:Login/Screens/product_details.dart';
import 'package:Login/Screens/products_screen.dart';
import 'package:Login/Screens/welcome.dart';
import 'package:Login/backend/products_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'backend/cart_model.dart';
import 'backend/oauth_module.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductModel>(
      create: (_) => ProductModel(),
      child: ChangeNotifierProvider<OAuth>(
        create: (_) => OAuth(),
        child: ChangeNotifierProvider<CartModel>(
          create: (_) => CartModel(),
          child: MaterialApp(
            theme: ThemeData.dark().copyWith(),
            initialRoute: '/',
            routes: {
              '/': (context) => Welcome(),
              ProductsScreen.id: (context) => ProductsScreen(),
              LoginScreen.id: (context) => LoginScreen(),
              CartPage.id: (context) => CartPage(),
            },
            // ignore: missing_return
            onGenerateRoute: (RouteSettings settings) {
              var route = settings.name.split('/');
              if (route[1] == "details") {
                return MaterialPageRoute(
                    builder: (BuildContext context) => ProductDetails(
                        Provider.of<ProductModel>(context)
                            .getProductByID((route[2]))));
              }
            },
          ),
        ),
      ),
    );
  }
}
