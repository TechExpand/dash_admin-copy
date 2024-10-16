import 'Product.dart';

class Store {
  Map? user;
  String? market;
  String? id;
  String ?name;
  bool ?isExpanded;
  String? storeType;
  String? country;
  String? verified;
  Map? state;
  String? description;
  List<Product> ?products;

  Store({this.market, required this.verified, this.user,this.description, this.products, this.isExpanded = false, this.id, this.name, this.storeType, this.country, this.state});

  Map<String, dynamic> toJson() {
    return {
      "market": market,
      "state": state,
      "user": user,
      "verified": verified,
      "description": description,
      "name": name,
      "storeType": storeType,
      "country": country,
      '_id': id,
    };
  }

  factory Store.fromJson(jsonData) =>  Store(
      market: jsonData["market"],
      verified: jsonData["verified"],
      state: jsonData["state"],
      storeType: jsonData["storeType"],
      description: jsonData["description"],
      country: jsonData["country"],
      id: jsonData['_id'],
      user: jsonData["user"],
      name: jsonData["name"]
  );
}
