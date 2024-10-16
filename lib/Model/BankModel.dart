import 'dart:convert';

class BankModel {
  String? title;
  String? id;
  String? code;
  Map? user;

  String? account;
  String? bank;
  int? bankid;

  BankModel(
      {this.title, this.bankid, this.code, this.id, this.user, this.bank, this.account});

  Map<String, dynamic> toJson() {
    return {
      "name": title??'',
      "_id": id??'',
      "id": bankid??'',
      "account": account??'',
      "bank": bank??'',
      "code": code??'',
      "user": user,
    };
  }

  factory BankModel.fromJson(jsonData) => BankModel(
        title: jsonData["name"]??"",
        bankid: jsonData["id"]??0,
        id: jsonData["_id"]??"",
        bank: jsonData["bank"]??'',
        account: jsonData["account"]??'',
        code: jsonData['code']??'',
        user: jsonData["user"],
      );
}
