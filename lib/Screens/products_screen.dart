import 'package:Login/Screens/login.dart';
import 'package:Login/backend/oauth_module.dart';
import 'package:Login/backend/products_model.dart';
import 'package:Login/component/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import 'cart_page.dart';

class ProductsScreen extends StatelessWidget {
  static String id = '/products';

  @override
  Widget build(BuildContext context) {
    print(Provider.of<OAuth>(context).registeredUser.username);

    _authedAppBar() => AppBar(
          leading: IconButton(
            icon: Icon(Icons.store),
            onPressed: () => Navigator.pushNamed(context, CartPage.id),
          ),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(12.0),
              child: IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () async {
                  await Provider.of<OAuth>(context, listen: false).signOut();
                  Navigator.pushReplacementNamed(context, LoginScreen.id);
                },
              ),
            )
          ],
          title: Text(Provider.of<OAuth>(context).registeredUser.username),
        );

    final _unAuthedAppBar = AppBar(
      centerTitle: true,
      title: FlatButton(
        child: Text('Register Here'),
        onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
      ),
    );

    final _appBar = PreferredSize(
        child: Provider.of<OAuth>(context).registeredUser.jwt != null
            ? _authedAppBar()
            : _unAuthedAppBar,
        preferredSize: Size.fromHeight(60));

    return Consumer<ProductModel>(
      builder: (context, productModel, child) => RefreshIndicator(
        onRefresh: Provider.of<ProductModel>(context).fetchAllProducts,
        child: Scaffold(
          appBar: _appBar,
          body: productModel.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  decoration: bodyDecoration,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                                childAspectRatio:
                                    MediaQuery.of(context).orientation ==
                                            Orientation.landscape
                                        ? 0.9
                                        : 1.0,
                                crossAxisCount:
                                    MediaQuery.of(context).orientation ==
                                            Orientation.landscape
                                        ? 3
                                        : 2,
                              ),
                              itemCount: productModel.products.length,
                              itemBuilder: (context, index) {
                                print(productModel.products[index].name);
                                return ProductCard(
                                    productModel.products[index]);
                              })),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
