class Services {
  String? title;
  String? id;
  String? icon;
  bool selected;
  String? category;

  Services(
      {this.title, this.selected = false, this.icon, this.category, this.id});

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "icon": icon,
      "category": category,
      '_id': id,
    };
  }

  factory Services.fromJson(jsonData) => Services(
      title: jsonData["title"],
      icon: jsonData["icon"],
      id: jsonData['_id'],
      category: jsonData["category"]);
}

class Following {
  String? id;
  dynamic store;
  dynamic user;
  dynamic storeuser;

  Following({this.id, this.store, this.user, this.storeuser});

  Map<String, dynamic> toJson() {
    return {
      "store": store,
      "user": user,
      "storeuser": storeuser,
      '_id': id,
    };
  }

  factory Following.fromJson(jsonData) => Following(
      store: jsonData["store"],
      storeuser: jsonData["storeuser"],
      user: jsonData['user'],
      id: jsonData["_id"]);
}

class Verification {
  String? id;
  dynamic? user;
  String? status;
  List<dynamic>? doc;
  String? date;

  Verification(
      {this.id, this.date, this.user, this.status, this.doc});

  Map<String, dynamic> toJson() {

    // status: String,
    // doc: [{ type: String }],
    // date: String,
    // user: { type: Schema.Types.ObjectId, ref: 'user' },

    return {
      "user": user,
      "date": date,
      "doc": doc,
      "status": status,
      '_id': id,
    };
  }

  factory Verification.fromJson(jsonData) => Verification(
      status: jsonData["status"],
      user: jsonData['user'],
      date: jsonData["date"],
      id: jsonData["_id"],
      doc: jsonData["doc"]);
}





class Markets {
  String? market;
  Services? subcategory;
  String? title;
  String? id;

  Markets(
      {this.market,this.subcategory,this.title, this.id});

  Map<String, dynamic> toJson() {
    return {
      "market": market,
      "subcategory": Services.fromJson(subcategory),
      '_id': id,
    };
  }

  factory Markets.fromJson(jsonData) => Markets(
      market: jsonData["market"],
      subcategory: jsonData["subcategory"],
      id: jsonData['_id']);
}