import 'dart:convert';
import 'dart:io';

import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/country_code_picker.dart';
import 'package:country_calling_code_picker/functions.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:matline/Module/Auth/Marchant/createAcc.dart';
// import 'package:matline/Module/Auth/User/createAcc.dart';
import 'package:provider/provider.dart';

import '../../utils.dart';
import '../Auth/otp.dart';
// import '../Home/HomePage.dart';
// import '../Home/bottomNav.dart';
import '../Pages/Phone.dart';
import '../Provider/AuthProvider.dart';
import 'loginAccount.dart';
// import 'registerOnbaord.dart';

class getStarted extends StatefulWidget {
  const getStarted({Key? key}) : super(key: key);

  @override
  State<getStarted> createState() => _getStartedState();
}

class _getStartedState extends State<getStarted> {
  Country _selectedCountry = Country("Nigeria", "flags/nga.png", "NG", "+234");

  dynamic mainCredential = '';

  @override
  Widget build(BuildContext context) {
    final country = _selectedCountry;

    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: true);

    // var auth = FirebaseAuth.instance;


    verifyNumber() async {
      try {
        print('$mainUrl/sendotp/${authProvider.number.toString()}');
        var url =
        Uri.parse('$mainUrl/sendotp/${authProvider.number.toString()}');
        var response = await http.post(url);
        int statusCode = response.statusCode;
        var body = response.body;
        Map<String, dynamic> theResponse = jsonDecode(body);

        if (statusCode >= 400) {
          authProvider.setLoad();

          showTextToast(
            text: theResponse['message'],
            context: context,
          );
        } else {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnihfmation) {
                return Phone(
                    verificationID: theResponse['serviceID'],
                    data: authProvider.number.toString(),
                    mainCredential: "",
                    dialCode: "+234",
                    page: 'Login');
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

          authProvider.setLoad();
        }
      } catch (e) {
        if (e.runtimeType == HandshakeException) {
          showTextToast(
            text: 'Connection Timeout',
            context: context,
          );
        } else if (e.runtimeType == SocketException) {
          showTextToast(
            text: 'No Internet Connection',
            context: context,
          );
        } else {
          showTextToast(
            text: 'Unable to Reset Password',
            context: context,
          );
        }
        authProvider.setLoad();
      }
    }

    return Scaffold(
        body: Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child:   Stack(
                    children: [
                      // Positioned(
                      //   right: 0,
                      //   child: Container(
                      //     width: MediaQuery.of(context).size.width*0.6,
                      //     height:  MediaQuery.of(context).size.height*0.5,
                      //     child: Image.asset('image/f1.png', fit: BoxFit.fill,),
                      //   ),
                      // ),
                      // Positioned(
                      //   right: 0,
                      //   child: Container(
                      //     width: 315,
                      //     child: Image.asset('image/f2.png', fit: BoxFit.contain,),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                      ),



                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 33),
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            "Welcome to Dash",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0.0, bottom: 8, left: 16, right: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, left: 15),
                              child: Text(
                                'Let’s get you started',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, left: 15),
                              child: Text(
                                'Phone number (Whatsapp)',
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                            Center(
                              child: Container(
                                margin: const EdgeInsets.only(top: 7.0),
                                width: MediaQuery.of(context).size.width * 0.85,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black54, width: 0.8)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 10),
                                      child: InkWell(
                                        onTap: () {
                                          _onPressedShowBottomSheet();
                                        },
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 20,
                                                  width: 35,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(3)),
                                                    child: Image.asset(
                                                      country.flag,
                                                      fit: BoxFit.cover,
                                                      package:
                                                          countryCodePackageName,
                                                      // scale: 5.5,
                                                    ),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: Colors.black26,
                                                )
                                              ],
                                            ),
                                          ),
                                          decoration: BoxDecoration(),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 1,
                                      decoration: BoxDecoration(
                                        color: Colors.black12,
                                      ),
                                    ),
                                    Container(
                                      height: 45,
                                      width: MediaQuery.of(context).size.width *
                                          0.66,
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.66,
                                            height: 40,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 3),
                                              child: TextFormField(
                                                // controller: controller,
                                                keyboardType:
                                                    TextInputType.phone,
                                                onChanged: (value) {
                                                  setState(() {
                                                    if(value.startsWith("0")){
                                                      authProvider.number = value.substring(1,value.length);
                                                      print(authProvider.number);
                                                    }else{
                                                      authProvider.number = value;
                                                      print(authProvider.number);
                                                    }

                                                  });
                                                },
                                                decoration: InputDecoration(
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    border: InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                    hintText:
                                                        'Enter phone number',
                                                    hintStyle: TextStyle(
                                                        color: Colors.black26)),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.83,
                            margin: EdgeInsets.symmetric(
                              horizontal: 2,
                            ),
                            height: 55,
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  authProvider.password = value;
                                });
                              },
                              style: TextStyle(color: Colors.black),
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                // fillColor: Color(0xFFF3F4F6),
                                // filled: true,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                                  child: Icon(Icons.key, color: Color(0xFF277798),),
                                ),
                                labelStyle: TextStyle(color: Colors.black38),
                                labelText: 'Password',
                                // enabledBorder: OutlineInputBorder(
                                //     borderSide: const BorderSide(
                                //         color: Color(0xFFF3F4F6), width: 1.1),
                                //     borderRadius: BorderRadius.all(Radius.circular(10))),
                                // focusedBorder: OutlineInputBorder(
                                //     borderSide: const BorderSide(
                                //         color: Color(0xFFF3F4F6), width: 1.1),
                                //     borderRadius: BorderRadius.all(Radius.circular(10))),
                                // border: OutlineInputBorder(
                                //     borderSide: const BorderSide(
                                //         color: Color(0xFFF3F4F6), width: 1.1),
                                //     borderRadius: BorderRadius.all(Radius.circular(10))),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25.0, bottom: 15),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF1B9AAF)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ))),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: authProvider.loading
                                  ? SizedBox(
                                      child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.white)),
                                      height: 30.0,
                                      width: 30.0,
                                    )
                                  : Text(
                                      'Continue',
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                            onPressed: authProvider.number.isEmpty||authProvider.password.isEmpty
                                ? () {}
                                : () {
                                    authProvider.setLoad();
                                    verifyNumber();
                                    FocusScopeNode currentFocus =
                                        FocusScope.of(context);
                                    if (!currentFocus.hasPrimaryFocus) {
                                      currentFocus.unfocus();
                                    }
                                  },
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  _onPressedShowBottomSheet() async {
    final country = await showCountryPickerSheet(
      context,
    );
    if (country != null) {
      setState(() {
        // Provider.of<AppData>(context).setCountryCode(country.callingCode);
        _selectedCountry = country;
      });
    }
  }
}
