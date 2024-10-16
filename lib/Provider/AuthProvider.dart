import 'dart:io';
import 'dart:async';
import 'dart:convert';
import '../dashboard.dart';
import '../Widget/sheet.dart';
import '../../Model/service.dart';
import 'package:flutter/material.dart';
import 'package:fl_toast/fl_toast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';

String mainUrl = "https://smtp.foodtruck.express";

class AuthProvider extends ChangeNotifier {
  String errorText = "";
  String number = "";
  String password = "";
  bool loading = false;
  String userId = "";
  String token = "";
  String email = "";
  String phone = "";
  String firstname = "";
  String lastname = "";
  String image = "";
  String accountType = "";
  String status = "";
  String dialCode = "+234";
  List<Services> states = [];
  Services? selectedState;
  Services? selectedMarket;
  Services? selectedCategoryPost;
  List<Services>? selectedCategory = [];
  List<Services>? selectedCategory2 = [];
  List<Services>? market;
  List<Services>? category;
  List<Services> category2 = [];
  List<Services>? specificSubCategory;
  List<Services> vendorspecificSubCategory = [];

  List<Services> allsubcategory = [];

  setState(Services value) {
    selectedState = value;
    notifyListeners();
  }

  setMarket(Services value) {
    selectedMarket = value;
    notifyListeners();
  }

  removeCategory(Services value) {
    selectedCategory?.remove(value);
    selectedCategory = selectedCategory;
    notifyListeners();
  }

  setCategory(Services value) {
    selectedCategory = (selectedCategory! + [value]);
    // .toSet().toList();

    notifyListeners();
  }

  setCategorySingle(Services value) {
    selectedCategory = ([value]);
    // .toSet().toList();

    notifyListeners();
  }

  setCategorySingle2(Services value) {
    selectedCategory2 = ([value]);
    // .toSet().toList();

    notifyListeners();
  }

  List<dynamic> index = [];

  setIndex(List data) {
    for (var i in data) {
      index = [...index, ""];
    }
    notifyListeners();
  }

  emptyIndex() {
    index.clear();

    selectedCategory!.clear();
    notifyListeners();
  }

  removeSingleIndex(indexValue) {
    index.removeAt(indexValue);
    selectedCategory!.removeAt(indexValue);
    notifyListeners();
  }

  setCategoryIndex(Services value, indexValue) {
    if (index.contains(indexValue)) {
      selectedCategory![indexValue] = value;
      selectedCategory = selectedCategory;

      notifyListeners();
    } else {
      index = (index + [indexValue]);
      selectedCategory = (selectedCategory! + [value]);
      // .toSet().toList();
      notifyListeners();
    }
  }

  setCategoryIndexProduct(Services value, indexValue) {
    index[indexValue] = value;
    selectedCategory = selectedCategory;
    notifyListeners();
  }

  setCategoryEmpty() {
    selectedCategory = [];
    index = [];
    notifyListeners();
  }

  setCategoryUpload(Services value) {
    selectedCategoryPost = value;
    // .toSet().toList();
    notifyListeners();
  }

  setDialCode(value) {
    dialCode = value;
    notifyListeners();
  }

  setNumber(value) {
    number = value;
    notifyListeners();
  }

  setLoad() {
    loading = !loading;
    notifyListeners();
  }

  Future<dynamic> createUserAccount(
      {context, phone, dialCode, firstname}) async {
    GetStorage box = GetStorage();
    try {
      var response = await http.post(Uri.parse('$mainUrl/signup'), body: {
        'phone': phone
            .toString()
            .substring(dialCode.length, phone.toString().length),
        "email": "",
        // "password": password,
        "firstname": firstname,
        "lastname": "",
        "image": "",
        "status": "completed",
        "accountType": "admin",
        "joined": DateTime.now().toString(),
      }, headers: {
        "Content-type": "application/x-www-form-urlencoded",
        // 'Authorization': 'Bearer $mainBearer',
      });

      var body = json.decode(response.body);
      print(body);

      if (response.statusCode <= 300) {
        userId = body['id'];
        token = body['token'];
        email = body['email'];
        phone = body['phone'];
        firstname = body['firstname'];
        lastname = body['lastname'];
        image = body['image'];
        accountType = body['accountType'];
        status = body['status'];

        box.erase();

        box.write("token", token);
        box.write("userId", userId);
        box.write("usertype", accountType);

        setLoad();
        return true;

        // sendDialogUser(context);
      } else {
        showTextToast(
          text: body['message'],
          context: context,
        );

        setLoad();
        return false;
      }
      notifyListeners();
    } catch (e) {
      print(e);
      setLoad();
      return false;
    }
  }

  Future<dynamic> createMarket({context, title, state}) async {
    try {
      var response =
          await http.post(Uri.parse('$mainUrl/create-market'), body: {
        'title': title.toString(),
        "state": state.toString(),
      }, headers: {
        "Content-type": "application/x-www-form-urlencoded",
        // 'Authorization': 'Bearer $mainBearer',
      });

      var body = json.decode(response.body);
      print(body);

      if (response.statusCode <= 300) {
        setLoad();
        sendDialogUser(context);
      } else {
        showTextToast(
          text: body["message"],
          context: context,
        );

        setLoad();
        return false;
      }
      notifyListeners();
    } catch (e) {
      print(e);
      setLoad();
      return false;
    }
  }

  Future<dynamic> assignMarket({context, subcarID, marketID}) async {
    try {
      var response = await http
          .post(Uri.parse('$mainUrl/assign-category-tomarket'), body: {
        'subcategory': subcarID.toString(),
        "market": marketID.toString(),
      }, headers: {
        "Content-type": "application/x-www-form-urlencoded",
        // 'Authorization': 'Bearer $mainBearer',
      });

      var body = json.decode(response.body);
      print(body);

      if (response.statusCode <= 300) {
        setLoad();
        sendDialogUser(context);
      } else {
        showTextToast(
          text: body["message"],
          context: context,
        );

        setLoad();
        return false;
      }
      notifyListeners();
    } catch (e) {
      print(e);
      setLoad();
      return false;
    }
  }

  Future<dynamic> assignCategory({context, carID, title}) async {
    try {
      var response =
          await http.post(Uri.parse('$mainUrl/create-subcategory'), body: {
        "title": title,
        "category": carID.toString(),
      }, headers: {
        "Content-type": "application/x-www-form-urlencoded",
        // 'Authorization': 'Bearer $mainBearer',
      });

      var body = json.decode(response.body);
      print(body);

      if (response.statusCode <= 300) {
        setLoad();
        sendDialogUser(context);
      } else {
        showTextToast(
          text: body["message"],
          context: context,
        );

        setLoad();
        return false;
      }
      notifyListeners();
    } catch (e) {
      print(e);
      setLoad();
      return false;
    }
  }

  Future<dynamic> createCategory({context, title}) async {
    try {
      var response = await http.post(Uri.parse('$mainUrl/category'), body: {
        "title": title,
        "icon": "",
      }, headers: {
        "Content-type": "application/x-www-form-urlencoded",
        // 'Authorization': 'Bearer $mainBearer',
      });

      var body = json.decode(response.body);
      print(body);

      if (response.statusCode <= 300) {
        setLoad();
        sendDialogUser(context);
      } else {
        showTextToast(
          text: body["message"],
          context: context,
        );

        setLoad();
        return false;
      }
      notifyListeners();
    } catch (e) {
      print(e);
      setLoad();
      return false;
    }
  }

  urlEncode({String? text}) {
    String? output = text;

    var detectHash = text!.contains('#');
    var detectAnd = text.contains('&');
    var detectSlash = text.contains('/');

    if (detectHash == true) {
      output = output!.replaceAll('#', '%23');
    }

    if (detectAnd == true) {
      output = output!.replaceAll('#', '%26');
    }

    if (detectSlash == true) {
      output = output!.replaceAll('#', '%2F');
    }

    return output;
  }

  Future<dynamic> login({context, phone, password, dialCode}) async {
    GetStorage box = GetStorage();
    try {
      var response = await http.post(Uri.parse('$mainUrl/login'), body: {
        'phone': number.toString(),
        "password": password,
      }, headers: {
        "Content-type": "application/x-www-form-urlencoded",
        // 'Authorization': 'Bearer $mainBearer',
      });
      print(response.body);
      var body = json.decode(response.body);

      if (response.statusCode <= 300) {
        userId = body['user'];
        token = body['token'];
        email = body['email'];
        this.phone = body['phone'];
        // surname = body['surname'];
        image = body['image'];
        accountType = body['accountType'];
        status = body['status'];

        box.write("token", token);
        box.write("userId", userId);
        box.write("usertype", accountType);
        // box.write("surname", surname);

        if (body["message"] == "User does not exist") {
          // setLoad();
          Navigator.pop(context);
          showTextToast(
            text: body['message'],
            context: context,
          );
        } else {
          Navigator.pop(context);
          if (accountType == "admin") {
            return Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return accountType == "admin" ? Dashboard() : Dashboard();
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            );
          } else {
            showTextToast(
              text: "Only admin can Login",
              context: context,
            );
          }
        }
      } else {
        Navigator.pop(context);
        showTextToast(
          text: body['message'],
          context: context,
        );
      }
      notifyListeners();
    } catch (e) {
      Navigator.pop(context);
    }
  }

  Future<dynamic> updatePrice({context, max, min, average}) async {
    print("$mainUrl/update-price");
    try {
      var response = await http.put(Uri.parse('$mainUrl/update-price'), body: {
        'maximum': max.toString(),
        "minimum": min.toString(),
        "average": average.toString(),
      }, headers: {
        "Content-type": "application/x-www-form-urlencoded",
        // 'Authorization': 'Bearer $mainBearer',
      });
      print(response.body);
      print(response.body);
      var body = json.decode(response.body);
      if (response.statusCode <= 300) {
        Navigator.pop(context);
        await showTextToast(
          text: body['message'],
          context: context,
        );
        return "";
      } else {
        Navigator.pop(context);
        showTextToast(
          text: body['message'],
          context: context,
        );
        return "";
      }
      notifyListeners();
    } catch (e) {
      Navigator.pop(context);
    }
  }

  Future<bool> checkUserExist() async {
    String fommatedPhone =
        number.toString().substring(dialCode.length, number.toString().length);
    var response = await http
        .get(Uri.parse("$mainUrl/checkuser/${fommatedPhone}"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      // 'Authorization': 'Token $token',
    }).timeout(Duration(seconds: 30));

    var body = json.decode(response.body);

    if (response.statusCode <= 300) {
      firstname = body["user"]["firstname"];
      lastname = body["user"]["lastname"];

      // loading = false;
      notifyListeners();
      return body["message"];
    } else {
      // loading = false;
      notifyListeners();
      return body["message"];
    }
  }

  int? maximum;
  int? minimum;
  int? average;

  Future getPrice() async {
    var response = await http.get(Uri.parse("$mainUrl/get-price"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      // 'Authorization': 'Token $token',
    }).timeout(Duration(seconds: 30));
    print(response.body);
    var body = json.decode(response.body);
    if (response.statusCode <= 300) {
      this.maximum = body["maximum"];
      this.minimum = body["minimum"];
      this.average = body["average"];
      notifyListeners();
    } else {
      notifyListeners();
    }
  }

  Future getMarkets() async {
    try {
      var response = await http
          .get(Uri.parse("$mainUrl/getmarket/${selectedState!.id}"), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Authorization': 'Token $token',
      }).timeout(Duration(seconds: 30));

      var body = json.decode(response.body);
      print(body);
      List body1 = body;
      List<Services> market = body1.map((data) {
        return Services.fromJson(data);
      }).toList();

      if (response.statusCode <= 300) {
        this.market = market;
        notifyListeners();
      } else {
        notifyListeners();
      }
    } on TimeoutException catch (e) {
      List<Services> defaul = [Services(title: 'network')];
      return defaul;
    } on SocketException catch (e) {
      List<Services> defaul = [Services(title: 'network')];

      return defaul;
    } on Error catch (e) {
      List<Services> defaul = [Services(title: 'network')];

      return defaul;
    }
  }

  Future getSubCategory() async {
    try {
      var response =
          await http.get(Uri.parse("$mainUrl/allsubcategory"), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Authorization': 'Token $token',
      }).timeout(Duration(seconds: 30));
      var body = json.decode(response.body);
      List body1 = body;
      List<Services> allsubcategory = body1.map((data) {
        return Services.fromJson(data);
      }).toList();

      if (response.statusCode <= 300) {
        this.allsubcategory = allsubcategory;
        notifyListeners();
      } else {
        notifyListeners();
      }
    } on TimeoutException catch (e) {
      List<Services> defaul = [Services(title: 'network')];
      return defaul;
    } on SocketException catch (e) {
      List<Services> defaul = [Services(title: 'network')];

      return defaul;
    } on Error catch (e) {
      List<Services> defaul = [Services(title: 'network')];

      return defaul;
    }
  }

  Future getCatSubCategory(catID) async {
    try {
      var response =
          await http.get(Uri.parse("$mainUrl/getsubcategory/$catID"), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Authorization': 'Token $token',
      }).timeout(Duration(seconds: 30));
      var body = json.decode(response.body);
      List body1 = body;
      List<Services> specificSubCategory = body1.map((data) {
        return Services.fromJson(data);
      }).toList();

      if (response.statusCode <= 300) {
        this.specificSubCategory = specificSubCategory;
        print(specificSubCategory[0].title);

        notifyListeners();
        return true;
      } else {
        notifyListeners();
        return false;
      }
    } on TimeoutException catch (e) {
      List<Services> defaul = [Services(title: 'network')];
      return false;
    } on SocketException catch (e) {
      List<Services> defaul = [Services(title: 'network')];

      return false;
    } on Error catch (e) {
      List<Services> defaul = [Services(title: 'network')];

      return false;
    }
  }

  List<Services>? marketspecificSubCategory;
  Future getMarketCategory({marketid}) async {
    try {
      var response = await http
          .get(Uri.parse("$mainUrl/get-market-category/$marketid"), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Authorization': 'Token $token',
      }).timeout(Duration(seconds: 30));
      var body = json.decode(response.body);
      List body1 = body;

      List<Services> marketspecificSubCategory = body1.map((data) {
        return Services.fromJson(data["subcategory"]);
      }).toList();
      print("finding");
      print(marketspecificSubCategory);
      if (response.statusCode <= 300) {
        this.marketspecificSubCategory = marketspecificSubCategory;
        // print(specificSubCategory[0].title);

        notifyListeners();
        return marketspecificSubCategory;
      } else {
        notifyListeners();
        return marketspecificSubCategory;
      }
    } on TimeoutException catch (e) {
      List<Services> defaul = [Services(title: 'network')];
      return [];
    } on SocketException catch (e) {
      List<Services> defaul = [Services(title: 'network')];

      return [];
    } on Error catch (e) {
      List<Services> defaul = [Services(title: 'network')];

      return [];
    }
  }

  setSubNull() {
    specificSubCategory = null;
    notifyListeners();
  }

  setMarketNull() {
    market = null;
    notifyListeners();
  }

  Future getCategory() async {
    try {
      var response =
          await http.get(Uri.parse("$mainUrl/allcategory"), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Authorization': 'Token $token',
      }).timeout(Duration(seconds: 30));
      var body = json.decode(response.body);
      List body1 = body;
      List<Services> category = body1.map((data) {
        return Services.fromJson(data);
      }).toList();

      if (response.statusCode <= 300) {
        this.category = category;

        notifyListeners();
      } else {
        notifyListeners();
      }
    } on TimeoutException catch (e) {
      List<Services> defaul = [Services(title: 'network')];
      return defaul;
    } on SocketException catch (e) {
      List<Services> defaul = [Services(title: 'network')];

      return defaul;
    } on Error catch (e) {
      List<Services> defaul = [Services(title: 'network')];

      return defaul;
    }
  }
}
