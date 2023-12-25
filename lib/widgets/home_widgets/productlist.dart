import 'package:demo/pages/home_details.dart';

import 'package:flutter/material.dart';

import '../../models/items.dart';
import '../../widgets/home_widgets/productItem.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ProductModel.x.length, //ProductModel.products.length,
      itemBuilder: (context, index) {
        final pro = ProductModel.x[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(i: pro))),
            child: ProductItem(i: pro));
      },
    );
  }
}
