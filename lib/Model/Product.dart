import 'package:image_picker/image_picker.dart';

class Product {
  dynamic? market;
  dynamic? category;
  String? caption;
  dynamic? store;
  dynamic? user;
  List? image;
  dynamic ?views;
 String?  invoice;
 String ?productID;
  dynamic ?file;
  String ?price;
  String ?favourite;
  String? id;
  String ?date;
  dynamic? state;
  int counter;
  String ?name;
  int currentIndex;
  bool selected;

  Product(
      {this.market,
        this.views,
        this.currentIndex = 1,
        this.price,
        this.invoice,
        this.file,
        this.date,
        this.productID,
        this.favourite,
      this.user,
        this.name,
        this.state,
        this.selected =  false,
        this.counter = 1,
      this.id,
      this.category,
      this.store,
      this.image,
      this.caption});

  Map<String, dynamic> toJson() {
    return {
      "market": market,
      "favourite": favourite??"",
      "invoice": invoice,
      "date": date,
      "productID":productID,
      "subcategory": category,
      "caption": caption,
      "store": store,
      "name": name,
      "user": user,
      "state": state,
      "views": views??"",
      "quantity":counter,
      "price": price,
      "image": image,
      '_id': id,
    };
  }

  factory Product.fromJson(jsonData) => Product(
      market: jsonData["market"]??"",
      category: jsonData["subcategory"]??[],
      caption: jsonData["caption"]??"",
      id: jsonData['_id']??"",
      views: jsonData['views']??"",
      favourite:jsonData["favourite"]??"",
      date: jsonData["date"]??'',
      name: jsonData["name"]??'',
      counter: jsonData["quantity"]??1,
      state: jsonData["state"]??"",
      price: jsonData["price"]??"",
      invoice: jsonData["invoice"]??"",
      productID: jsonData["productID"]??"",
      store: jsonData["store"]??"",
      user: jsonData["user"]??"",
      image: jsonData["image"]??[]);
}










