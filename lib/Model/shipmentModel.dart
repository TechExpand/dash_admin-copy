class DeliveryMainModel {
  String? id;

  // String ?created;
  String? state;
  String? shipType;
  String? price;
  String? deliveryID;

  dynamic? owner;
  dynamic? reciever;
  dynamic? recieverprofile;
  String? senderName;
  String? senderPhone;

  String? recieverName;
  String? recieverPhone;
  String? pickup;

  String? pickupLan;
  String? dropoffLan;
  String? pickupLog;

  String? dropoff;
  String? image;
  String? date;
  String? lan;
  String? ids;

  String? long;
  String? itemName;
  String? status;
  String? dropoffLog;
  String? amount;
  String? mode;

  List<dynamic>? deliveryinfo;

  DeliveryMainModel({
    this.id,
    this.senderName,
    this.mode,
    this.date,
    this.shipType,
    this.senderPhone,
    this.reciever,
    this.ids,
    this.deliveryID,
    this.state,
    this.dropoff,
    this.dropoffLog,
    this.dropoffLan,
    this.deliveryinfo,
    this.image,
    this.itemName,
    this.lan,
    this.long,
    this.owner,
    this.pickup,
    this.price,
    this.pickupLog,
    this.pickupLan,
    this.status,
    this.recieverPhone,
    this.amount,
    this.recieverName,
  });

  Map<String, dynamic> toJson() {
    return {
      // "created": created,
      '_id': id,
      "_id": ids,
      "date": date,
      "senderName": senderName,
      "reciever": reciever ?? {},
      "mode": mode,
      "deliveryinfo": deliveryinfo,
      "shipType": shipType,
      "senderPhone": senderPhone,
      "state": state,
      "dropoff": dropoff,
      "deliveryID": deliveryID,
      "dropoffLog": dropoffLog,
      "dropoffLan": dropoffLan,
      "image": image,
      "itemName": itemName,
      "lan": lan,
      "long": long,
      "owner": owner ?? {},
      "pickup": pickup,
      "price": price,
      "pickupLog": pickupLog,
      "pickupLan": pickupLan,
      "recieverPhone": recieverPhone,
      "recieverName": recieverName,
      "status": status,
      "amount": amount,
    };
  }

  factory DeliveryMainModel.fromJson(jsonData) => DeliveryMainModel(
        amount: jsonData["amount"],
    deliveryID:  jsonData["deliveryID"],
    date: jsonData["date"],
        deliveryinfo: jsonData["deliveryinfo"],
        id: jsonData['_id'],
        reciever: jsonData["reciever"],
        senderName: jsonData['senderName'],
        ids: jsonData["ids"],
        mode: jsonData["mode"],
        shipType: jsonData["shipType"],
        senderPhone: jsonData["senderPhone"],
        state: jsonData["state"],
        dropoff: jsonData["dropoff"],
        dropoffLog: jsonData["dropoffLog"],
        dropoffLan: jsonData["dropoffLan"],
        image: jsonData["image"],
        itemName: jsonData["itemName"],
        lan: jsonData["lan"],
        long: jsonData["long"],
        status: jsonData["status"],
        owner: jsonData["owner"],
        pickup: jsonData["pickup"],
        price: jsonData["price"],
        pickupLog: jsonData["pickupLog"],
        pickupLan: jsonData["pickupLan"],
        recieverPhone: jsonData["recieverPhone"],
        recieverName: jsonData["recieverName"],
      );
}
