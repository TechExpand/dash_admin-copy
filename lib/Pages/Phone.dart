import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../Provider/AuthProvider.dart';
import '../Widget/Circular.dart';


class Phone extends StatefulWidget {
  var verificationID;
  final data;
  final password;
  final mainCredential;
  final page;
  final name;
  final dialCode;
  final type;

  Phone({this.verificationID,this.name, this.password, this.type, this.dialCode, this.data, this.mainCredential, this.page});


  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {

  String otp = "";

  Timer ?_timer;
  int _start = 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }


  signinWithPhoneAndSMScode(smsCode) async {
    AuthProvider authProvider = Provider.of<AuthProvider>(context, listen:false);

    try {
      var url = Uri.parse('$mainUrl/verifyotp/${widget.verificationID}/$smsCode');
      var response = await http.post(url);
      int statusCode = response.statusCode;
      var body = response.body;
      Map<String, dynamic> theResponse = jsonDecode(body);

      if (statusCode >= 400) {
        Navigator.pop(context);
        showTextToast(
          text: theResponse['message'],
          context: context,
        );
      }else{
          authProvider.login(
            password: authProvider.password,
            phone: authProvider.number,
            dialCode: authProvider.dialCode,
            context: context,
          );
      }

    } catch (e) {
      showTextToast(
        text:  e.toString(),
        context: context,
      );
      authProvider.setLoad();
    }
  }


  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
    Provider.of<AuthProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(

          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top:40, bottom: 20),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                       print(authProvider.phone);
                        print(authProvider.number);
                      },
                      child: Material(
                        color: Colors.transparent,
                        child: Icon(Icons.arrow_back_ios,
                            size: 26,
                            color: Color(0xFF277798)),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            // SizedBox(height: MediaQuery.of(context).size.height*0.26,),
            // Container(
            //     width: 280,
            //     child: Image.asset(widget.page == "Forget"?"image/pass2.png":
            //     "image/verify.png", fit: BoxFit.fill,)),


            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Align(
                child: Text("Enter the Code sent to",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black)),
                alignment: Alignment.topLeft,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
              child: Align(
                child: Text("+234${widget.data}", style: TextStyle(color: Color(0xFF277798)),),
                alignment: Alignment.topLeft,
              ),
            ),


            Container(
              width: MediaQuery.of(context).size.width*0.86,
              child: Center(
                child: PinCodeTextField(
                  length:4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(20),
                    borderWidth: 1,
                    fieldHeight: 55,
                    fieldWidth: 60,
                    inactiveColor: Color(0xFFF3F4F6),
                    activeFillColor: Color(0xFFF3F4F6),
                    selectedColor:  Color(0xFFF3F4F6),
                    inactiveFillColor: Color(0xFFF3F4F6),
                    selectedFillColor:  Color(0xFFF3F4F6),
                    activeColor:  Color(0xFFF3F4F6),
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  // backgroundColor: lightbluish,
                  enableActiveFill: true,
                  // errorAnimationController: errorController,
                  keyboardType: TextInputType.number,
                  onCompleted: (v) {
                    circularCustom(context);
                    signinWithPhoneAndSMScode(v);
                  },
                  onChanged: (value){
                    // setState((){
                    //   otp = value;
                    // });
                  },
                  beforeTextPaste: (text) {
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  appContext: context,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.access_time, size: 23, color: Color(0xFF277798),),
                  Text(" ${_start}:00", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Align(
              alignment: Alignment
                  .bottomCenter,
              child: Padding(
                padding:
                const EdgeInsets
                    .only(
                    top: 10.0,bottom: 15),
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation:
                      MaterialStateProperty
                          .all(0),
                      backgroundColor:
                      MaterialStateProperty
                          .all(_start!=0?Color(0xFF1B9AAF).withOpacity(0.5):
                      Color(0xFF1B9AAF)),
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius
                                .circular(
                                25.0),
                          ))),
                  child: Container(
                    width: MediaQuery.of(
                        context)
                        .size
                        .width *
                        0.26,
                    height: 40,
                    alignment: Alignment
                        .center,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius
                            .circular(
                            10)),
                    child: Text(
                      'Resend Code',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors
                              .white),
                    ),
                  ),
                  onPressed:
                  _start!=0?(){}:() {

                    Future<dynamic>   verifyNumber() async {


                      try {

                        var url = Uri.parse('$mainUrl/sendotp/${authProvider.number.toString()}');
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
                          return false;
                        } else {
                          widget.verificationID = theResponse['serviceID'];

                          return true;
                        }
                      } catch (e) {
                        if (e.runtimeType == HandshakeException) {
                          showTextToast(
                            text: 'Connection Timeout',
                            context: context,
                          );
                          return false;
                        } else if (e.runtimeType == SocketException) {

                          showTextToast(
                            text: 'No Internet Connection',
                            context: context,
                          );
                          return false;
                        } else {
                          print(e);
                          showTextToast(
                            text: 'Unable to Reset Password',
                            context: context,
                          );

                          return false;
                        }
                      }
                    }

                    verifyNumber();
                    setState(() {
                      _start = 60;
                      startTimer();
                    });
                    showTextToast(
                      text: "code sent",
                      context: context,
                    );


                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
