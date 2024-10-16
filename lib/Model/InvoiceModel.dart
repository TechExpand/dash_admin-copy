

class InvoiceModel {
  String? title;
  String? id;
  String? createdDate;
  String? updatedDate;
  int? totalProduct;
  bool? viewed;
  int? deliveryFee;
  Map? vendor;
  String? status;
  Map? store;
  Map? user;
  String? deliveryAddress;

  InvoiceModel({this.title,
    this.id,
    this.status,
    this.viewed,
    this.updatedDate,
    this.createdDate,
    this.totalProduct,
    this.deliveryAddress,
    this.store,
    this.deliveryFee,
    this.vendor,
    this.user
  });

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "title": title,
      "deliveryAddress": deliveryAddress,
      "viewed": viewed,
      "_id": id,
      "updatedDate": updatedDate,
      'createdDate': createdDate,
      "totalProduct": totalProduct,
      'deliveryFee': deliveryFee,
      "vendor": vendor,
      "store": store,
      'user': user,
    };
  }

  factory InvoiceModel.fromJson(jsonData) => InvoiceModel(
    title: jsonData["market_name"],
    id: jsonData["_id"],
    deliveryAddress: jsonData["deliveryAddress"],
    status: jsonData["status"],
    viewed:jsonData["viewed"],
    updatedDate: jsonData["updatedDate"],
    createdDate: jsonData['createdDate'],
    totalProduct: jsonData["totalProduct"],
    deliveryFee: jsonData['deliveryFee'],
    vendor: jsonData["vendor"],
    store: jsonData["store"],
    user: jsonData['user'],
  );
}
