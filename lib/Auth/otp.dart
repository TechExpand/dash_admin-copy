// import 'package:coin_mika/Screen/Home/CoinDetail.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../Provider/AuthProvider.dart';
import '../constant/color.dart';
import '../utils.dart';


class OTP extends StatefulWidget {
  var verificationID;
  final data;
  final password;
  final mainCredential;
  final page;
  final name;
  final dialCode;
  final type;

  OTP({this.verificationID,this.name, this.password, this.type, this.dialCode, this.data, this.mainCredential, this.page});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> with TickerProviderStateMixin {
  double portforlioHeight = 55.0;
  int currentindex = 0;
  TabController ?tabController;

  String otp = "";

  Timer ?_timer;
  // var auth = FirebaseAuth.instance;
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


  void initState() {
    super.initState();
    startTimer();
    tabController = TabController(
      initialIndex: 0,
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  signinWithPhoneAndSMScode(smsCode) async {
    AuthProvider authProvider = Provider.of<AuthProvider>(context, listen:false);

    try {
      var url = Uri.parse('https://martline.onrender.com/verifyotp/${widget.verificationID}/$smsCode');
      var response = await http.post(url);
      int statusCode = response.statusCode;
      var body = response.body;
      Map<String, dynamic> theResponse = jsonDecode(body);

      if (statusCode >= 400) {
        authProvider.setLoad();
        RequestHelper().showInErrorSnackBar(context, theResponse['message']);

      }else{
        bool result = await  authProvider.checkUserExist();
        if(result){
          authProvider.login(
            // password: password.text,
            phone: authProvider.number,
            dialCode: authProvider.dialCode,
            context: context,
          );

          // Navigator.push(
          //   context,
          //   PageRouteBuilder(
          //     pageBuilder: (context, animation, secondaryAnimation) {
          //       return LoginAccount();
          //     },
          //     transitionsBuilder:
          //         (context, animation, secondaryAnimation, child) {
          //       return FadeTransition(
          //         opacity: animation,
          //         child: child,
          //       );
          //     },
          //   ),
          // );
        }




      }


    } catch (e) {
      RequestHelper().showInErrorSnackBar(context, e.toString());
      authProvider.setLoad();


    }
  }


  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context, listen:true);





    return Scaffold(
        backgroundColor: Colors.white,
        body: DefaultTabController(
          length: 5,
          child: Container(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: transBlack,
                  ),
                ),
                SingleChildScrollView(
                  // physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only( top: 10, bottom: 0),
                          child: Container(
                            margin: EdgeInsets.only( top: 0),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                )
                            ),
                            child: SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only( top: 25, bottom: 0),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            padding: EdgeInsets.all(5),
                                            onPressed: (){
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(Icons.arrow_back,
                                                color:Colors.black),
                                          ),
                                          Spacer(),
                                          IconButton(
                                            padding: EdgeInsets.all(5),
                                            onPressed: (){
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(MdiIcons.close,
                                                color:Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                         Align(
                                             alignment: Alignment.topLeft,
                                             child: Text("Sign up", style: TextStyle(
                                                 fontWeight: FontWeight.bold, fontSize: 27),)),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text("Verify phone number", style: TextStyle(
                                                    fontWeight: FontWeight.bold, fontSize: 14),)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text("Enter 6-digit code sent to you on", style: TextStyle(
                                                 fontSize: 14),)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text("${widget.data}", style: TextStyle(
                                                    fontWeight: FontWeight.bold, fontSize: 14),)),
                                          ),


                                          SizedBox(height: MediaQuery.of(context).size.height*0.25,),


                                          PinCodeTextField(
                                            length: 6,
                                            obscureText: false,
                                            animationType: AnimationType.fade,

                                            pinTheme: PinTheme(
                                                shape: PinCodeFieldShape.underline,
                                                // borderRadius: BorderRadius.circular(10),
                                                borderWidth: 1,
                                                // fieldHeight: 50,
                                                // fieldWidth: 50,
                                                inactiveColor: Colors.black45,
                                                activeFillColor: Colors.black45,
                                                selectedColor: Colors.black45,
                                                inactiveFillColor: Colors.black45,
                                                selectedFillColor: Colors.black45,
                                                activeColor: Colors.black45,
                                            ),
                                            animationDuration: Duration(milliseconds: 300),
                                            // backgroundColor: lightbluish,
                                            // enableActiveFill: true,
                                            // errorAnimationController: errorController,
                                            keyboardType: TextInputType.number,
                                            onCompleted: (v) {},
                                              onChanged: (value){
                                                setState((){
                                                  otp = value;
                                                });
                                              },
                                            beforeTextPaste: (text) {
                                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                              return true;
                                            },
                                            appContext: context,
                                          ),


                                          // OTPTextField(
                                          //   onChanged: (value){
                                          //     setState((){
                                          //       otp = value;
                                          //     });
                                          //   },
                                          //   length: 6,
                                          //   width: MediaQuery.of(context).size.width,
                                          //   fieldWidth: 40,
                                          //   style: TextStyle(
                                          //       fontSize: 34,
                                          //     color: Colors.black45
                                          //   ),
                                          //   textFieldAlignment: MainAxisAlignment.spaceAround,
                                          //   fieldStyle: FieldStyle.underline,
                                          //   onCompleted: (pin) {
                                          //     print("Completed: " + pin);
                                          //   },
                                          // ),


                                          Padding(
                                            padding: const EdgeInsets.only(top: 12.0, right: 20),
                                            child: Align(
                                                alignment: Alignment.topRight,
                                                child: _start != 0?Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    Text("Re-send code in",
                                                      style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 16),),
                                                    Text(" ${_start}", style: TextStyle(
                                                        fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                        color: Colors.green),),
                                                  ],
                                                ):Align(
                                                  alignment: Alignment.bottomRight,
                                                  child: TextButton(
                                                     style: TextButton.styleFrom(
                                                       backgroundColor: Colors.transparent,
                                                       textStyle: TextStyle(color: Colors.black)
                                                     ),
                                                      onPressed: () {

                                                     Future<dynamic>   verifyNumber() async {


                                                          try {

                                                            var url = Uri.parse('https://martline.onrender.com/sendotp/${authProvider.number.toString()}');
                                                            var response = await http.post(url);
                                                            int statusCode = response.statusCode;
                                                            var body = response.body;
                                                            Map<String, dynamic> theResponse = jsonDecode(body);

                                                            if (statusCode >= 400) {
                                                              authProvider.setLoad();

                                                              RequestHelper().showInErrorSnackBar(context, theResponse['message']);
                                                              return false;
                                                            } else {
                                                              widget.verificationID = theResponse['serviceID'];
                                                              RequestHelper().showInSuccessSnackBar(context, "code sent");
                                                              return true;
                                                            }
                                                          } catch (e) {
                                                            if (e.runtimeType == HandshakeException) {
                                                              RequestHelper().showInErrorSnackBar2(context, 'Connection Timeout');
                                                              return false;
                                                            } else if (e.runtimeType == SocketException) {
                                                              RequestHelper().showInErrorSnackBar2(context, 'No Internet Connection');
                                                              return false;
                                                            } else {
                                                              RequestHelper().showInErrorSnackBar2(context, 'Unable to Reset Password');
                                                              return false;
                                                            }
                                                          }
                                                        }

                                                     verifyNumber().then((value) {
                                                        setState(() {
                                                        _start = 60;
                                                        startTimer();
                                                        });
                                                        });
                                                      },
                                                      child: Text('Resend Code', style: TextStyle(color:Colors.black))),
                                                ),

                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                              padding: const EdgeInsets.only(top:25.0),
                                              child: ElevatedButton(
                                                style:  ButtonStyle(
                                                    elevation: MaterialStateProperty.all(0),
                                                    backgroundColor: MaterialStateProperty.all(Color(0xFFFF7711)),
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(10.0),
                                                        )
                                                    )
                                                ),

                                                child: Container(
                                                  width: MediaQuery.of(context).size.width*0.75,
                                                  height: 50,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                                  child: authProvider.loading? SizedBox(
                                                    child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                                                    height: 30.0,
                                                    width: 30.0,
                                                  ): Text('Verify number', style: TextStyle(color: Colors.white),),
                                                ),
                                                onPressed: otp.isEmpty?(){}:() {
                                                  authProvider.setLoad();
                                                  signinWithPhoneAndSMScode(otp);
                                                  // Navigator.push(
                                                  //   context,
                                                  //   PageRouteBuilder(
                                                  //     pageBuilder:
                                                  //         (context, animation, secondaryAnimation) {
                                                  //       return getStarted();
                                                  //     },
                                                  //     transitionsBuilder: (context, animation,
                                                  //         secondaryAnimation, child) {
                                                  //       return FadeTransition(
                                                  //         opacity: animation,
                                                  //         child: child,
                                                  //       );
                                                  //     },
                                                  //   ),
                                                  // );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
