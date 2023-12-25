// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:demo/models/cart.dart';
import 'package:demo/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:demo/models/items.dart';
import 'package:demo/utils/themes.dart';
import '../core/store.dart';
import '../models/items.dart';
import '../widgets/drawer.dart';
import '../widgets/home_widgets/homeheader.dart';
import '../widgets/home_widgets/productlist.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final dummyList = List.generate(10, (index) => ProductModel.products[0]);
  // final urli = ""
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    //await Future.delayed(Duration(seconds: 4));
    /* final res = await http.get(Uri.parse(urli)); // http.get(Uri(host: urli));
    final itemjson = res.body; */
    final itemjson = await rootBundle.loadString("assets/files/items.json");
    final decodejson = jsonDecode(itemjson);
    var productsData = decodejson["products"];
    // List<Items> list =
    ProductModel.x =
        List.from(productsData).map<Items>((e) => Items.fromMap(e)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/back.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, _, __) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            child: const Icon(CupertinoIcons.cart),
          ).badge(
              color: Colors.transparent,
              position: VxBadgePosition.rightTop,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
              size: 22,
              count: _cart.itemss.length),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: MyTheme.darkColor, size: 30),
          ),
        ),
        drawer: const MyDrawer(),
        body: SafeArea(
            child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderClass(),
              if (ProductModel.x.isNotEmpty)
                ProductList().py12().expand()
              else
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        )),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text(
    //       "Home Page",
    //       style: TextStyle(color: Colors.black),
    //     ),
    //     // backgroundColor: Colors.white,
    //     // elevation: 0.0,
    //     // iconTheme: const IconThemeData(color: Colors.black),
    //   ),
    //   drawer: const MyDrawer(),
    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: (ProductModel.products != null &&
    //             ProductModel.products.isNotEmpty)
    //         ? // ListView.builder(
    //         //     itemCount: ProductModel
    //         //         .products.length, //ProductModel.products.length,
    //         //     itemBuilder: (context, index) {
    //         //       return ItemWidget(
    //         //         item: ProductModel
    //         //             .products[index], //ProductModel.products[index],
    //         //       );
    //         //     },
    //         //   )

    //         //==============ListView Ennds here==========================

    //         GridView.builder(
    //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //                 mainAxisSpacing: 16,
    //                 crossAxisSpacing: 16,
    //                 crossAxisCount: 2),
    //             itemCount: ProductModel.products.length,
    //             itemBuilder: (context, index) {
    //               final i = ProductModel.products[index];
    //               return Card(
    //                 clipBehavior: Clip.antiAlias,
    //                 elevation: 6,
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(12)),
    //                 child: GridTile(
    //                   header: Container(
    //                       padding: const EdgeInsets.all(5),
    //                       decoration:
    //                           const BoxDecoration(color: Colors.blueAccent),
    //                       child: Text(
    //                         i.name,
    //                         style: const TextStyle(color: Colors.black),
    //                       )),
    //                   footer: Container(
    //                       padding: const EdgeInsets.all(3),
    //                       decoration: const BoxDecoration(),
    //                       child: Text(
    //                         "\$" + i.price.toString(),
    //                         style: const TextStyle(fontWeight: FontWeight.bold),
    //                       )),
    //                   child: Image.network(
    //                     i.img,
    //                   ),
    //                 ),
    //               );
    //             })
    //         : Center(
    //             child: CircularProgressIndicator(),
    //           ),
    //   ),
    // );
  }
}
