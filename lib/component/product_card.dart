import 'package:Login/Screens/product_details.dart';
import 'package:Login/backend/Products/Products.dart';
import 'package:Login/backend/cart_model.dart';
import 'package:cache_image/cache_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  ProductCard(this.product);
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cartModel, child) => InkWell(
        onTap: () =>
            Navigator.pushNamed(context, ProductDetails.id + '/' + product.id),
        child: Material(
          borderRadius: BorderRadius.circular(12),
          elevation: 12,
          child: GridTile(
            child: Hero(
              tag: product.id,
              child: Image(
                fit: BoxFit.cover,
                image: CacheImage('$laptopLink${product.image}',
                    duration: Duration(seconds: 2),
                    durationExpiration: Duration(seconds: 10)),
              ),
            ),
            footer: GridTileBar(
              title: FittedBox(
                child: Text(product.name),
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
              ),
              subtitle: Text('\$ ' + product.price.toString()),
              backgroundColor: Colors.black45.withOpacity(0.5),
              trailing: IconButton(
                onPressed: () => cartModel.toggleCartProduct(product),
                icon: Icon(
                  Icons.shopping_cart,
                  color: cartModel.isInCart(product.id)
                      ? Colors.deepOrange
                      : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
