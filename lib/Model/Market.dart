class Market {
  String? title;
  String? id;
  List? store;
  List? product;

  Market({this.title, this.store, this.id, this.product});

  Map<String, dynamic> toJson() {
    return {
      "market_name": title,
      "stores": store,
      "products": product,
      'market_id': id,
    };
  }

  factory Market.fromJson(jsonData) => Market(
        title: jsonData["market_name"],
        product: jsonData["products"],
        store: jsonData["stores"],
        id: jsonData['market_id'],
      );
}
