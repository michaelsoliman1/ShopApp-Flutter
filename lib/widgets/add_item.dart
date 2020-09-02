import 'package:flutter/material.dart';

import '../providers/cart.dart';
import '../providers/product.dart';

class AddItemWidget extends StatelessWidget {
  const AddItemWidget({
    Key key,
    @required this.cart,
    @required this.product,
    @required this.icon,
  }) : super(key: key);

  final Cart cart;
  final Product product;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: () {
        cart.addItem(product.id, product.price, product.title);
        Scaffold.of(context).hideCurrentSnackBar();
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Added to cart.'),
          action: SnackBarAction(
            label: 'UNDO',
            onPressed: () {
              cart.removeSingleItem(product.id);
            },
          ),
        ));
      },
    );
  }
}
