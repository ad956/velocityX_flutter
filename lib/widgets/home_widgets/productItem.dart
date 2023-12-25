import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/items.dart';
import '../../pages/add_to_cart.dart';
import '../../utils/themes.dart';

class ProductItem extends StatelessWidget {
  final Items i;
  const ProductItem({
    Key? key,
    required this.i,
  })  : assert(i != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      child: VxBox(
          child: Row(
        children: [
          Hero(
              tag: Key(i.price.toString()),
              child: ProductImage(
                image: i.img,
              )),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              i.name.text.lg.color(MyTheme.creamColor).bold.make(),
              i.desc.text
                  .textStyle(context.captionStyle)
                  .sm
                  .color(MyTheme.creamColor)
                  .make(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${i.price}"
                      .text
                      .color(MyTheme.darkWhiteColor)
                      .bold
                      .xl
                      .make(),
                  addTo(
                    i: i,
                  )
                ],
              )
            ],
          ))
        ],
      )).transparent.rounded.square(150).py16.make(), //.emerald100
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.rounded.p8.make().p16().w32(context);
  }
}
