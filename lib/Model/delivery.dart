class DeliveryLocationModel {
  String? id;

  String? senderName;
  String? senderPhone;

  String? recieverName;
  String? recieverPhone;
  String? pickup;
  String? deliveryID;

  String? pickupLan;
  String? dropoffLan;
  String? pickupLog;

  String? ids;
  String? dropoff;
  String? dropoffLog;


  DeliveryLocationModel({
    this.id,
    this.senderName,
    this.senderPhone,
    this.dropoff,
    this.dropoffLog,
    this.deliveryID,
    this.dropoffLan,
    this.pickup,
    this.pickupLog,
    this.pickupLan,
    this.ids,
    this.recieverPhone,
    this.recieverName,
  });

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      "_id": ids,
      "senderName": senderName,
      "senderPhone": senderPhone,
      "dropoff": dropoff,
      "deliveryID": deliveryID,
      "dropoffLog": dropoffLog,
      "dropoffLan": dropoffLan,
      "pickup": pickup,
      "pickupLog": pickupLog,
      "pickupLan": pickupLan,
      "recieverPhone": recieverPhone,
      "recieverName": recieverName,
    };
  }

  factory DeliveryLocationModel.fromJson(jsonData) => DeliveryLocationModel(
    id: jsonData['_id'],
    ids: jsonData["_id"],
    senderName: jsonData['senderName'],
    senderPhone: jsonData["senderPhone"],
    dropoff: jsonData["dropoff"],
    deliveryID: jsonData["deliveryID"],
    dropoffLog: jsonData["dropoffLog"],
    dropoffLan: jsonData["dropoffLan"],
    pickup: jsonData["pickup"],
    pickupLog: jsonData["pickupLog"],
    pickupLan: jsonData["pickupLan"],
    recieverPhone: jsonData["recieverPhone"],
    recieverName: jsonData["recieverName"],
  );
}
