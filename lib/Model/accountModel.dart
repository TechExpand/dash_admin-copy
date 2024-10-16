import 'Product.dart';

class userModel {
  String? email;
  String? phone;
  String? surname;
  String? image;
  String? accountType;
  String? status;
  String? joined;
  bool ? suspended;
  String? id;
  // email phone surname image accountType status  joined

  userModel({
    this.email,
    this.phone,
    this.surname,
    this.id,
    this.image,
    this.accountType,
    this.status,
    this.suspended,
    this.joined,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "phone": phone,
      "_id": id,
      "surname": surname,
      "image": image,
      "suspended":suspended,
      "accountType": accountType,
      "status": status,
      "joined": joined,
    };
  }

  factory userModel.fromJson(jsonData) => userModel(
    email: jsonData["email"],
    phone: jsonData["phone"],
    surname: jsonData["surname"],
    suspended: jsonData["suspended"],
    id: jsonData["_id"],
    image: jsonData["image"],
    accountType: jsonData["accountType"],
    status: jsonData["status"],
    joined: jsonData["joined"],
  );
}





class PinModel {
  String? pin;
  String? id;
  String? user;


  PinModel({
    this.pin,
    this.user,
    this.id,
  });

  Map<String, dynamic> toJson(){
    return {
      "_id": id,
      "user": user,
      "pin": pin,
    };
  }

  factory PinModel.fromJson(jsonData) => PinModel(
    id: jsonData["_id"],
    user: jsonData["user"],
    pin: jsonData["pin"],
  );
}






class ProfileModel {
  String? email;
  String? phone;
  String? firstname;
  String? lastname;
  String? image;
  String? accountType;
  String? status;
  String? joined;
  String? id;


  ProfileModel({
    this.email,
    this.phone,
    this.firstname,
    this.lastname,
    this.image,
    this.accountType,
    this.status,
    this.joined,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "phone": phone,
      "firstname": firstname,
      "lastname": lastname,
      "image": image,
      "accountType": accountType,
      "status": status,
      "joined": joined,
      "_id": id,
    };
  }

  factory ProfileModel.fromJson(jsonData) => ProfileModel(
    email: jsonData["email"],
    phone: jsonData["phone"],
    firstname: jsonData["firstname"],
    lastname: jsonData["lastname"],
    image: jsonData["image"],
    accountType: jsonData["accountType"],
    status: jsonData["status"],
    joined: jsonData["joined"],
    id: jsonData["_id"],
  );
}








class StoreModel {

  String? name;
  Map? state;
  String? id;
  String ?description;
  String? lat;
  String ?address;
  String? long;
  String? country;
  List<dynamic>? subcategory;
  String? storeType;
  Map? user;
  String ?verified;
  Map? market;
  bool ?isExpanded;
  List<Product> ?products;

  StoreModel({
    this.id,
    this.name,
    this.state,
    this.verified,
    this.lat,
    this.isExpanded = false,
    this.long,
    this.description,
    this.address,
    this.user,
    this.market,
    this.country,
    this.subcategory,
    this.storeType,
  });

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "description": description!.isEmpty|| description==null?"set description": description,
      "state": state,
      "lat": lat,
      "verified": verified,
      "address":address!.isEmpty|| address==null?"set address": address,
      "user": user,
      "market": market,
      "long": long,
      "country": country,
      "subcategory": subcategory,
      "storeType": storeType,
    };
  }

  factory StoreModel.fromJson(jsonData) => StoreModel(
    id: jsonData["_id"],
    verified: jsonData["verified"],
    name: jsonData["name"],
    description: jsonData["description"].isEmpty|| jsonData["description"]==null?"set description": jsonData["description"],
    state: jsonData["state"],
    lat: jsonData["lat"],
    address: jsonData["address"]!.isEmpty|| jsonData["address"]==null?"set address": jsonData["address"],
    user: jsonData["user"],
    market: jsonData["market"],
    long: jsonData["long"],
    country: jsonData["country"],
    subcategory: jsonData["subcategory"],
    storeType: jsonData["storeType"],
  );
}
