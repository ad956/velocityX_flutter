// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:velocity_x/velocity_x.dart';

import 'package:demo/core/store.dart';
import 'package:demo/models/items.dart';

class CartModel {
//singleton class making

  // static final cartModel = CartModel._internal();

  // CartModel._internal();

  // factory CartModel() => cartModel;
  //product field

  static late ProductModel _pro;

  ///  changes----------------------

  //collection of IDs - store IDs of each item
  final List<int> _itemIds = [];
  //get product

  // ignore: unnecessary_getters_setters
  ProductModel get pro => _pro;

  set pro(ProductModel newPro) {
    assert(newPro != null);
    _pro = newPro;
  }

//get items in cart
  List<Items> get itemss => _itemIds.map((id) => _pro.getById(id)).toList();

//get item price
  num get totalPrice =>
      itemss.fold(0, (total, currValue) => total + currValue.price);

//add item
  void addItem(Items i) {
    _itemIds.add(i.id);
  }

//remove item
  void remItem(Items i) {
    _itemIds.remove(i.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Items item;
  AddMutation({
    required this.item,
  });
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
    throw UnimplementedError();
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Items item;
  RemoveMutation({
    required this.item,
  });
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
    throw UnimplementedError();
  }
}
