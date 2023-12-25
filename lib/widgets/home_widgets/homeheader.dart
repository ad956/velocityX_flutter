import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../utils/themes.dart';

class HeaderClass extends StatelessWidget {
  const HeaderClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Anand Suthar".text.xl5.bold.color(MyTheme.darkColor).make(),
        "Results are shown".text.xl2.color(MyTheme.darkColor).make(),
      ],
    );
  }
}
