class EarningModel {
  String? id;
  String? amount;
  String? date;
  dynamic? user;

  EarningModel({
    this.id,
    this.amount,
    this.date,
    this.user,
  });

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      "amount": amount,
      "date": date,
      "user": user,
    };
  }

  factory EarningModel.fromJson(jsonData) => EarningModel(
    amount: jsonData["amount"],
    id: jsonData['_id'],
    date: jsonData["date"] ,
    user: jsonData['user'],
  );
}
