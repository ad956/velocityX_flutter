// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:demo/pages/add_to_cart.dart';
import 'package:demo/utils/themes.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/items.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({
    Key? key,
    required this.i,
  })  : assert(i != null),
        super(key: key);
  final Items i;
  @override
  Widget build(BuildContext context) {
    timeDilation = 3;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(),
        child: Scaffold(
          bottomNavigationBar: Container(
            color: Colors.white,
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${i.price}".text.color(MyTheme.darkColor).bold.xl.make(),
                // ElevatedButton(
                //         onPressed: () {},
                //         style: ButtonStyle(
                //             shape: MaterialStateProperty.all(
                //                 const StadiumBorder()),
                //             backgroundColor:
                //                 MaterialStateProperty.all(Colors.deepPurple)),
                //         child: "Buy".text.make())
                addTo(i: i).w20(context)
              ],
            ).wh(100, 70).px12(),
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            children: [
              Hero(
                  tag: Key(i.price.toString()),
                  child: Image.network(i.img).p16().h32(context)),
              Expanded(
                child: VxArc(
                  edge: VxEdge.top, // Use VxEdge.top instead of VxEdge.TOP
                  arcType: VxArcType.convex,
                  height: 28.0,
                  child: Container(
                    width: context.screenWidth,
                    color: Colors.white, //Colors.amberAccent,
                    child: Column(
                      children: [
                        i.name.text.xl2.color(MyTheme.darkColor).bold.make(),
                        i.desc.text
                            .textStyle(context.captionStyle)
                            .size(15)
                            .color(MyTheme.darkColor)
                            .make(),
                        10.heightBox,
                        "Ullamco labore est aliquip dolor ad Lorem pariatur magna. Laborum incididunt labore nisi esse quis nisi est mollit cillum culpa. Incididunt sint aute tempor aute aliquip ad Ullamco labore est aliquip dolor ad Lorem pariatur magna. Laborum incididunt labore nisi esse quis nisi est mollit cillum culpa. Incididunt sint aute tempor aute aliquip ad"
                            .text
                            .size(15)
                            .color(MyTheme.darkColor)
                            .make()
                            .p16(),
                      ],
                    ).py32(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
