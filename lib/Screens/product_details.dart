import 'package:Login/backend/Products/Products.dart';
import 'package:cache_image/cache_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config.dart';
import '../constant.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  ProductDetails(this.product);

  static String id = '/details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(product.name),
      ),
      body: Container(
        decoration: bodyDecoration,
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: Container(
                    child: Hero(
                      tag: product.id,
                      child: Image(
                        width: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? double.infinity
                            : 400,
                        fit: BoxFit.cover,
                        image: CacheImage('$laptopLink${product.image}',
                            durationExpiration: Duration(seconds: 10)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  product.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 25),
                ),
                Text(
                  '\$ ' + product.price.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: 15,
                ),
                Text.rich(TextSpan(
                    text: product.description, style: TextStyle(fontSize: 16))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
