import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'AuthProvider.dart';
import '../Model/delivery.dart';
import '../../Model/Product.dart';
import '../../Model/service.dart';
import '../Model/accountModel.dart';
import '../Model/shipmentModel.dart';
import '../../Model/AdvertModel.dart';
import 'package:flutter/material.dart';
import 'package:fl_toast/fl_toast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:martline_admin/Model/Earning.dart';


// import 'package:dio/dio.dart';
// import 'package:matline/Module/Provider/AccountProvider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../Home/bottomNav.dart';

class AdvertService extends ChangeNotifier{
  final List<XFile> imageUrls = [];


  Future getDeliveryLocation(deliveryID) async {
    print("getting my location ooooo ${deliveryID}");
    // String userID = box.read("userId");
    try {
      var response = await http.get(
          Uri.parse(
              '${mainUrl}/getdelivery/${deliveryID}'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            // 'Authorization': 'Token $token',
          }).timeout(Duration(seconds: 20));
      print(response.body);
      // print(response.body);
      // print(response.body);
      var body = json.decode(response.body);

      List body1 = body;

      List<DeliveryLocationModel> userReview = body1.map((data) {
        return DeliveryLocationModel.fromJson(data);
      }).toList();

      // print("doneeee");
      // print(userReview);
      // print(userReview);

      notifyListeners();
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        if (userReview.isEmpty) {
          List<DeliveryLocationModel> defaul = [];
          return defaul;
        } else {
          // print(userReview);
          return userReview;
        }
      } else {
        List<DeliveryLocationModel> defaul = [];
        return defaul;
      }
    } on TimeoutException catch (e) {
      List<DeliveryLocationModel> defaul = [];
      return defaul;
    } on SocketException catch (e) {
      List<DeliveryLocationModel> defaul = [];
      return defaul;
    } on Error catch (e) {
      List<DeliveryLocationModel> defaul = [];
      return defaul;
    }
  }

  List<TextEditingController> ?textControllers;


  emptyIndex(){
    textControllers!.clear();
    textControllers = textControllers;
    notifyListeners();
  }





  bool sending = false;
  setLoading(){
    sending = !sending;
    notifyListeners();
  }

  GetStorage box = GetStorage();

  List<Product> ?products;
  List<Product> ?searchproducts;








  Future<dynamic> editAdvert(Product product, context) async {
    String   newCategoryIDs =  product.category.toString().replaceAll(" ", "").replaceAll("[", "").replaceAll("]", "").replaceAll(",", " ");
    String   newImages =  product.image.toString().replaceAll(" ", "").replaceAll("[", "").replaceAll("]", "").replaceAll(",", " ");
    // String userId = box.read("userId");


    var response = await http.put(
        Uri.parse(
            "$mainUrl/product/${product.id}"),
        body: {
          "subcategory": newCategoryIDs,
          "user": product.user.toString(),
          "store": product.store.toString(),
          "market": product.market.toString(),
          "state": product.state.toString(),
          "caption": product.caption.toString(),
          "price": product.price.toString(),
          "name": product.name.toString(),
          "views": product.views.toString(),
          "image":  newImages,
        },
        headers: {
          // 'Content-Type': 'application/json; charset=UTF-8',
          // 'Authorization': 'Token $token',
        }).timeout(Duration(seconds: 60));

    print(response.body);
    print(response.body);
    var body = json.decode(response.body);
    if(response.statusCode <=300){
      // String body1 = body["message"];
      // setLoad();
      // Navigator.pop(context);
      showTextToast(
        text: "Saved",
        context: context,
      );
      setLoading();
      notifyListeners();

      return true;
    }else{
      setLoading();
      notifyListeners();
      // setLoad();
      // showTextToast(
      //   text: body['message'],
      //   context: context,
      // );
      return false;
    }
  }

  Future<dynamic> advertViews(Product product) async {

    var response = await http.put(
        Uri.parse(
            "$mainUrl/productviews/${product.id}"),
        body: {
          "views": product.views.toString(),
        },
        headers: {
        }).timeout(Duration(seconds: 60));

    print(response.body);
    print(response.body);
    var body = json.decode(response.body);
    if(response.statusCode <=300){

      notifyListeners();

      return true;
    }else{
      notifyListeners();
      return false;
    }
  }




  Future<dynamic> updateAdvert(id, status, context) async {

    var response = await http.put(
        Uri.parse(
            "$mainUrl/advertupdate/$id"),
        body: {
          "status": status.toString(),
        },
        headers: {
        }).timeout(Duration(seconds: 60));

    print(response.body);
    print(response.body);
    var body = json.decode(response.body);
    if(response.statusCode <=300){

      notifyListeners();
      showTextToast(
        text: "Approved",
        context: context,
      );

      return true;
    }else{
      showTextToast(
        text: "unable to approve",
        context: context,
      );
      notifyListeners();
      return false;
    }
  }


  Future<dynamic> updateSuspention(userId, status, context) async {

    var response = await http.post(
        Uri.parse(
            "https://smtp.foodtruck.express/update-user/$userId"),
        body: {
         "suspended": status.toString()
        },
        headers: {
        }).timeout(Duration(seconds: 60));

    print(response.body);
    print(response.body);
    var body = json.decode(response.body);
    if(response.statusCode <=300){

      notifyListeners();
      showTextToast(
        text: "${status?"Suspended":"Approved"}",
        context: context,
      );

      return true;
    }else{
      showTextToast(
        text: "unable to approve ${status?"Suspended":"Approved"}",
        context: context,
      );
      notifyListeners();
      return false;
    }
  }


  Future<dynamic> updateVerification(userId, verifyId, status, context) async {

    var response = await http.post(
        Uri.parse(
            "https://smtp.foodtruck.express/verifyupdate/$userId/$verifyId"),
        body: {

        },
        headers: {
        }).timeout(Duration(seconds: 60));

    print(response.body);
    print(response.body);
    var body = json.decode(response.body);
    if(response.statusCode <=300){

      notifyListeners();
      showTextToast(
        text: "Approved",
        context: context,
      );

      return true;
    }else{
      showTextToast(
        text: "unable to approve",
        context: context,
      );
      notifyListeners();
      return false;
    }
  }



  Future getAdvert() async {
    // String userId = box.read("userId");
    try {
      var response = await http.get(
          Uri.parse(
              "$mainUrl/advert"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            // 'Authorization': 'Token $token',
          }).timeout(Duration(seconds: 60));
      var body = json.decode(response.body);
     print(response.body);
      List body1 = body;
      List<AdvertModel> product = body1.map((data) {
        return AdvertModel.fromJson(data);
      }).toList();

      if (response.statusCode <= 300) {
        notifyListeners();
        return product;
      } else {
        notifyListeners();
        return product;
      }
    } on TimeoutException catch (e) {
      print(e);
      List<AdvertModel> defaul = [AdvertModel(title: 'network')];
      return defaul;
    } on SocketException catch (e) {
      print(e);
      List<AdvertModel> defaul = [AdvertModel(title: 'network')];

      return defaul;
    } on Error catch (e) {
      print(e);
      List<AdvertModel> defaul = [AdvertModel(title: 'network')];

      return defaul;
    }
  }


  Future getVerification() async {
    // String userId = box.read("userId");
    try {
      var response = await http.get(
          Uri.parse(
              "https://smtp.foodtruck.express/verification"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            // 'Authorization': 'Token $token',
          }).timeout(Duration(seconds: 60));
      var body = json.decode(response.body);

      List body1 = body;

      List<Verification> product = body1.map((data) {
        return Verification.fromJson(data);
      }).toList();
      // print(product);
      if (response.statusCode <= 300) {
        notifyListeners();
        return product;
      } else {
        notifyListeners();
        return product;
      }
    } on TimeoutException catch (e) {
      print(e);
      List<Verification> defaul = [Verification(status: 'network')];
      return defaul;
    } on SocketException catch (e) {
      print(e);
      List<Verification> defaul = [Verification(status: 'network')];

      return defaul;
    } on Error catch (e) {
      print(e);
      List<Verification> defaul = [Verification(status: 'network')];

      return defaul;
    }
  }





  Future getAdView(adId) async {
    print("$mainUrl/getadviews/$adId");
    try {
      var response = await http.get(
          Uri.parse(
              "$mainUrl/getadviews/$adId"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            // 'Authorization': 'Token $token',
          }).timeout(Duration(seconds: 60));
      var body = json.decode(response.body);
      print("getting my babe");
      print(response.body);
      List body1 = body;
      List<AdViewModel> product = body1.map((data){
        return AdViewModel.fromJson(data);
      }).toList();

      if (response.statusCode <= 300) {
        notifyListeners();
        return product;
      } else {
        notifyListeners();
        return product;
      }
    } on TimeoutException catch (e) {
      print(e);
      List<AdViewModel> defaul = [AdViewModel(title: 'network')];
      return defaul;
    } on SocketException catch (e) {
      print(e);
      List<AdViewModel> defaul = [AdViewModel(title: 'network')];

      return defaul;
    } on Error catch (e) {
      print(e);
      List<AdViewModel> defaul = [AdViewModel(title: 'network')];

      return defaul;
    }
  }

  Future getAdClick(adId) async {
    print("$mainUrl/getadclicks/$adId");
    try {
      var response = await http.get(
          Uri.parse(
              "$mainUrl/getadclicks/$adId"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            // 'Authorization': 'Token $token',
          }).timeout(Duration(seconds: 60));
      var body = json.decode(response.body);
      print("getting my babe");
      print(response.body);
      List body1 = body;
      List<AdViewModel> product = body1.map((data){
        return AdViewModel.fromJson(data);
      }).toList();

      if (response.statusCode <= 300) {
        notifyListeners();
        return product;
      } else {
        notifyListeners();
        return product;
      }
    } on TimeoutException catch (e) {
      print(e);
      List<AdViewModel> defaul = [AdViewModel(title: 'network')];
      return defaul;
    } on SocketException catch (e) {
      print(e);
      List<AdViewModel> defaul = [AdViewModel(title: 'network')];

      return defaul;
    } on Error catch (e) {
      print(e);
      List<AdViewModel> defaul = [AdViewModel(title: 'network')];

      return defaul;
    }
  }


  Future<dynamic> DeleteAdvert(
      context,
      {
        id,
      }) async {

    // String userId = box.read("userId");

    var response = await http.delete(
        Uri.parse(
            "$mainUrl/product/${id}"),
        headers: {
          // 'Content-Type': 'application/json; charset=UTF-8',
          // 'Authorization': 'Token $token',
        }).timeout(Duration(seconds: 60));



    var body = json.decode(response.body);

    if(response.statusCode <=300){
      Navigator.pop(context);
      Navigator.pop(context, "delete");
      // String body1 = body["message"];

      return true;
    }else{
      Navigator.pop(context);
      showTextToast(
        text: "unable to delete product",
        context: context,
      );
      return false;
    }
  }

  List<userModel> alluserList = [];
  userModel ?selectedUser;

  changeSelectedUser(userModel user) {
    selectedUser = user;
    notifyListeners();
  }



  Future getUsers() async {
    print('${mainUrl}/getallusers');
    // String userID = box.read("userId");
    try {
      var response = await http.get(
          Uri.parse(
              '${mainUrl}/getallusers'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            // 'Authorization': 'Token $token',
          }).timeout(Duration(seconds: 20));
      var body = json.decode(response.body);
      List body1 = body;
      List<userModel> Usershipment = body1.map((data) {
        return userModel.fromJson(data);
      }).toList();
// print(Usershipment[0].deliveryinfo);
      notifyListeners();
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        print(Usershipment);
        if (Usershipment.isEmpty) {
          List<userModel> defaul = [];
          return defaul;
        } else {
          print(Usershipment);
          alluserList = Usershipment;
          notifyListeners();
          return Usershipment;
        }
      } else {
        print('failed');
      }
    } on TimeoutException catch (e) {
      List<userModel> defaul = [userModel(surname: 'network')];
      return defaul;
    } on SocketException catch (e) {
      List<userModel> defaul = [userModel(surname: 'network')];
      print('Socket Error: $e');
      return defaul;
    } on Error catch (e) {
      List<userModel> defaul = [userModel(surname: 'network')];
      print('General Error: $e');
      return defaul;
    }
  }

  Future getShipment() async {
    print('${mainUrl}/getallshipment');
    // String userID = box.read("userId");
    try {
      var response = await http.get(
          Uri.parse(
              '${mainUrl}/getallshipment'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            // 'Authorization': 'Token $token',
          }).timeout(Duration(seconds: 20));
      var body = json.decode(response.body);
      List body1 = body;
      List<DeliveryMainModel> Usershipment = body1.map((data) {
        return DeliveryMainModel.fromJson(data);
      }).toList();
// print(Usershipment[0].deliveryinfo);
      notifyListeners();
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        print(Usershipment);
        if (Usershipment.isEmpty) {
          List<DeliveryMainModel> defaul = [];
          return defaul;
        } else {
          print(Usershipment);
          return Usershipment;
        }
      } else {
        print('failed');
      }
    } on TimeoutException catch (e) {
      List<DeliveryMainModel> defaul = [DeliveryMainModel(amount: 'network')];
      return defaul;
    } on SocketException catch (e) {
      List<DeliveryMainModel> defaul = [DeliveryMainModel(amount: 'network')];
      print('Socket Error: $e');
      return defaul;
    } on Error catch (e) {
      List<DeliveryMainModel> defaul = [DeliveryMainModel(amount: 'network')];
      print('General Error: $e');
      return defaul;
    }
  }




  Future getEarning() async {
    print('${mainUrl}/getallearnings');
    // String userID = box.read("userId");
    try {
      var response = await http.get(
          Uri.parse(
              '${mainUrl}/getallearnings'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            // 'Authorization': 'Token $token',
          }).timeout(Duration(seconds: 20));
      var body = json.decode(response.body);
      List body1 = body;
      List<EarningModel> Usershipment = body1.map((data) {
        return EarningModel.fromJson(data);
      }).toList();
// print(Usershipment[0].deliveryinfo);
      notifyListeners();
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        print(Usershipment);
        if (Usershipment.isEmpty) {
          List<EarningModel> defaul = [];
          return defaul;
        } else {
          print(Usershipment);
          return Usershipment;
        }
      } else {
        print('failed');
      }
    } on TimeoutException catch (e) {
      List<EarningModel> defaul = [EarningModel(amount: 'network')];
      return defaul;
    } on SocketException catch (e) {
      List<EarningModel> defaul = [EarningModel(amount: 'network')];
      print('Socket Error: $e');
      return defaul;
    } on Error catch (e) {
      List<EarningModel> defaul = [EarningModel(amount: 'network')];
      print('General Error: $e');
      return defaul;
    }
  }




}
