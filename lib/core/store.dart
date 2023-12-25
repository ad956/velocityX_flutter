import 'package:demo/models/cart.dart';
import 'package:demo/models/items.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late ProductModel product;
  late CartModel cart;

  MyStore() {
    product = ProductModel();
    cart = CartModel();
    cart.pro = product;
  }
}
