import 'package:Login/backend/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';
import '../product_card.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cartModel, child) => Container(
        decoration: bodyDecoration,
        child: Column(
          children: <Widget>[
            Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 0.9
                          : 1.0,
                      crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 3
                          : 2,
                    ),
                    itemCount: cartModel.cartProducts.length,
                    itemBuilder: (context, index) {
                      print(cartModel.cartProducts[index].name);
                      return ProductCard(cartModel.cartProducts[index]);
                    })),
          ],
        ),
      ),
    );
  }
}
