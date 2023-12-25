import 'package:demo/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../core/store.dart';
import '../utils/themes.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/back.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Cart"),
          centerTitle: true,
          titleTextStyle:
              const TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: MyTheme.darkColor, size: 30),
        ),
        body: Column(
          children: [CartList().p32().expand(), Divider(), _CartTotal()],
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  _CartTotal({Key? key}) : super(key: key);
  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
              //  notifications: {},
              builder: (context, _, __) {
                return "\$${_cart.totalPrice}"
                    .text
                    .xl4
                    .color(MyTheme.darkWhiteColor)
                    .make();
              },
              mutations: const {RemoveMutation}),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Buying Not Supported".text.white.make(),
                      //backgroundColor: Colors.red,
                    ));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(MyTheme.darkColor),
                  ),
                  child: "Buy".text.make())
              .w24(context)
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  // final _cart = CartModel();

  CartList({Key? key}) : super(key: key);
  // @override
  // void initState() {
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.itemss.isEmpty
        ? const AnimeMsg()
        : ListView.builder(
            itemCount: _cart.itemss.length,
            itemBuilder: (context, index) => ListTile(
                  leading: const Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
                  trailing: IconButton(
                      onPressed: () =>
                          //  _cart.remItem(_cart.itemss[index]);
                          RemoveMutation(item: _cart.itemss[index]),
                      //  setState(() {});
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.white,
                      )),
                  title: _cart.itemss[index].name.text.bold.white.make(),
                ));
  }
}

class AnimeMsg extends StatelessWidget {
  const AnimeMsg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -50,
      right: 285,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your cart is empty ;(",
            style: TextStyle(
              color: MyTheme.darkWhiteColor,
              fontSize: 35,
            ),
          ),
        ],
      ),
    );
  }
}
