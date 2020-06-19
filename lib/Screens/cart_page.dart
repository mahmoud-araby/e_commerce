import 'package:Login/backend/cart_model.dart';
import 'package:Login/component/tabs/cart.dart';
import 'package:Login/component/tabs/credit.dart';
import 'package:Login/component/tabs/recepit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  static String id = '/cart';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Consumer<CartModel>(
        builder: (context, cart, child) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Cart Page'),
            bottom: TabBar(
              unselectedLabelColor: Colors.deepOrange[900],
              labelColor: Colors.deepOrange[300],
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.shopping_cart,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.credit_card,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.receipt,
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Cart(),
              Credit(),
              Recepit(),
            ],
          ),
        ),
      ),
    );
  }
}
