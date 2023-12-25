import 'package:demo/core/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';
import '../models/items.dart';

class addTo extends StatelessWidget {
  // final _cart = CartModel();

  final Items i;
  addTo({
    Key? key,
    required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    //  final ProductModel _product = (VxState.store as MyStore).product;

    bool isInCart = _cart.itemss.contains(i) ? true : false;
    return ElevatedButton(
        onPressed: () {
          //  final _product = ProductModel();
          if (!isInCart) {
            // _cart.pro = _product;
            // _cart.addItem(i);
            AddMutation(item: i);
            // isInCart = isInCart.toggle();

            //  setState(() {});
          }
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all(const StadiumBorder()),
            backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
        child: isInCart
            ? const Icon(Icons.done)
            : const Icon(
                CupertinoIcons.cart_badge_plus)); //"Add to cart".text.make());
  }
}
