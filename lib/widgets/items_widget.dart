import 'package:demo/models/items.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({Key? key, required this.item}) : super(key: key);

  final Items item;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15.0,
      child: ListTile(
        onTap: () {
          print("object");
        },
        leading: Image.network(
          item.img,
          height: 100,
          width: 70,
        ),
        title: Text(
          item.name,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle:
            Text(item.desc, style: TextStyle(fontWeight: FontWeight.w600)),
        trailing: Text("\$${item.price}",
            textScaleFactor: 1.2,
            style: TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}
