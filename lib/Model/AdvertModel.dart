import 'package:image_picker/image_picker.dart';

class AdvertModel {
  dynamic? store;
  dynamic? user;
  dynamic? category;
  String? url;
  List? market;
  List? image;
  List? state;
  int? views;
  int? clicks;
  String? startDate;
  String? status;
  String? id;
  String? endDate;
  String? landType;
  String? title;

  AdvertModel(
      {this.store,
        this.title,
      this.user,
      this.category,
      this.url,
      this.market,
      this.image,
        this.status,
      this.state,
      this.views,
      this.endDate,
      this.landType,
        this.id,
      this.startDate,
      this.clicks});

  Map<String, dynamic> toJson() {
    return {
      "market": market,
      "store": store,
      "user": user,
      "subcategory": category,
      "url": url,
      "market": market,
      "image": image,
      "_id": id,
      "status": status,
      "state": state,
      "views": views,
      "endDate": endDate,
      "landType": landType,
      "startDate": startDate,
      "clicks": clicks
    };
  }

  factory AdvertModel.fromJson(jsonData) => AdvertModel(
        market: jsonData["market"] ?? [],
    id: jsonData["_id"] ?? [],
        store: jsonData["store"] ?? "",
        user: jsonData["user"] ?? "",
    category: jsonData["subcategory"] ?? "",
        url: jsonData["url"] ?? "",
        image: jsonData["image"] ?? [],
    status: jsonData["status"]??"",
        state: jsonData["state"] ?? [],
        views: jsonData["views"] ?? 0,
        endDate: jsonData["endDate"] ?? "",
        landType: jsonData["landType"] ?? "",
        startDate: jsonData["startDate"] ?? "",
        clicks: jsonData["clicks"] ?? 0,
      );
}





class AdViewModel {
  String? user;
  String? id;
  String? date;
  String? status;
  String? advert;
String? title;

  AdViewModel(
      {
        this.user,
        this.id,
        this.title,
        this.date,
        this.status,
        this.advert});

  Map<String, dynamic> toJson() {
    return {
      "user": user,
      "date": date,
      "status": status,
      "_id": id,
      "advert": advert,
    };
  }

  factory AdViewModel.fromJson(jsonData) => AdViewModel(
    user: jsonData["user"] ?? "",
    date: jsonData["date"] ?? "",
    id: jsonData["_id"] ?? "",
    advert: jsonData["advert"] ?? "",
    status: jsonData["status"] ?? "",
  );
}

// status: String,
// advert: { type: Schema.Types.ObjectId, ref: 'advert' },
// date: String,
// user:  { type: Schema.Types.ObjectId, ref: 'user' },