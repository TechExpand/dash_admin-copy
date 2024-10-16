class Transactions {
  String? title;
  Map? user;
  String ?id;
  String? amount;
  String? date;
  String ?invoice;
  Map? store;
  Map? shop;
  String? market;
  bool? reviwed;


  Transactions({
    this.title,
    this.id,
    this.user,
    required this.shop,
    this.date,
    this.amount,
    this.invoice,
    this.store,
    this.market,
    this.reviwed
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "user": user,
      "amount": amount,
      "date": date,
      "shop": shop,
      "_id": id,
      "invoice": invoice,
      "store": store,
      "market": market,
      "reviwed": reviwed,
    };
  }

  factory Transactions.fromJson(jsonData) => Transactions(
    title: jsonData["title"],
    user: jsonData["user"],
    amount: jsonData["amount"],
    date: jsonData["date"],
    id: jsonData["_id"],
    invoice: jsonData['invoice'],
    shop: jsonData["shop"],
    store: jsonData["store"],
    market: jsonData["market"],
    reviwed: jsonData['reviwed'],
  );
}
