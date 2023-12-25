class ProductModel {
  // static final proModel = ProductModel._internal();
  // ProductModel._internal();
  // factory ProductModel() => proModel;

  static late List<Items> x;

  Items getById(int id) =>
      x.firstWhere((element) => element.id == id, orElse: null);
  Items getByPosition(int pos) => x[pos];

  // static var products = [
  //   Items(
  //       id: 1,
  //       name: "ad956",
  //       img:
  //           "https://insights.dice.com/wp-content/uploads/2019/07/Software-Developer-Software-Engineer-Dice.png",
  //       desc: "Flutter App Dev",
  //       price: 956)
  // ];
}

class Items {
  final int id;
  final String name;
  final String img;
  final String desc;
  final num price;

  Items(
      {required this.id,
      required this.name,
      required this.img,
      required this.desc,
      required this.price});

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
        id: map["id"],
        desc: map["desc"],
        name: map["name"],
        price: map["price"],
        img: map["img"]);
  }
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "img": img,
        "price": price,
      };
}
