// // import 'package:coin_mika/Screen/Home/CoinDetail.dart';
// import 'package:country_calling_code_picker/country.dart';
// import 'package:country_calling_code_picker/country_code_picker.dart';
// import 'package:country_calling_code_picker/functions.dart';
// import 'package:fl_toast/fl_toast.dart';
// import 'package:flutter/material.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:provider/provider.dart';
// import '../Provider/AuthProvider.dart';
// import 'otp.dart';
//
//
// class LoginAccount extends StatefulWidget {
//   final type;
//    LoginAccount({this.type});
//
//   @override
//   State<LoginAccount> createState() => _LoginAccountState();
// }
//
// class _LoginAccountState extends State<LoginAccount> with TickerProviderStateMixin {
//   double portforlioHeight = 55.0;
//   int currentindex = 0;
//   TabController? tabController;
//
//   TextEditingController password = TextEditingController();
//   // TextEditingController fullname = TextEditingController();
//
//   Country _selectedCountry  = Country("Nigeria", "flags/nga.png", "NG", "+234");
//   TextEditingController controller = TextEditingController();
//
//   // var auth = FirebaseAuth.instance;
//
//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(
//       initialIndex: 0,
//       length: 5,
//       vsync: this,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: true);
//     dynamic mainCredential = '';
//     final country = _selectedCountry;
//
//
//
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: DefaultTabController(
//           length: 5,
//           child: Container(
//             child: Stack(
//               children: [
//                 SingleChildScrollView(
//                   // physics: NeverScrollableScrollPhysics(),
//                   padding: EdgeInsets.zero,
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.02,
//                       ),
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: Padding(
//                           padding: EdgeInsets.only(top: 10, bottom: 0),
//                           child: Container(
//                             margin: EdgeInsets.only(top: 0),
//                             width: MediaQuery.of(context).size.width,
//                             height: MediaQuery.of(context).size.height,
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(20),
//                                   topLeft: Radius.circular(20),
//                                 )),
//                             child: SingleChildScrollView(
//                               physics: NeverScrollableScrollPhysics(),
//                               child: Column(
//                                 children: [
//                                   Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Padding(
//                                       padding:
//                                       EdgeInsets.only(top: 25, bottom: 0),
//                                       child: Row(
//                                         children: [
//                                           IconButton(
//                                             padding: EdgeInsets.all(5),
//                                             onPressed: () {
//                                               Navigator.pop(context);
//                                             },
//                                             icon: Icon(Icons.arrow_back,
//                                                 color: Colors.black),
//                                           ),
//                                           Spacer(),
//                                          Text("")
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   SingleChildScrollView(
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 15.0, right: 15),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                         children: [
//                                           Align(
//                                               alignment: Alignment.topLeft,
//                                               child: Text(
//                                                 "Welcome, ${authProvider.firstname}" "${authProvider.lastname}",
//                                                 style: TextStyle(
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 27),
//                                               )),
//                                           Padding(
//                                             padding:
//                                             const EdgeInsets.only(top: 8.0),
//                                             child: Align(
//                                                 alignment: Alignment.topLeft,
//                                                 child: Text(
//                                                   "Sign into your martline admin",
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                       FontWeight.bold,
//                                                       fontSize: 14),
//                                                 )),
//                                           ),
//                                           Container(
//                                             height: MediaQuery.of(context)
//                                                 .size
//                                                 .height *
//                                                 0.733,
//                                             // color: Colors.red,
//                                             child: PageView(
//                                               children: [
//                                                 Column(
//                                                   children: [
//                                                     // SizedBox(
//                                                     //   height:
//                                                     //       MediaQuery.of(context)
//                                                     //               .size
//                                                     //               .height *
//                                                     //           0.45,
//                                                     // ),
//                                                     Spacer(),
//                                                     Padding(
//                                                       padding:
//                                                       const EdgeInsets.only(
//                                                           top: 8.0,
//                                                           bottom: 8,
//                                                           left: 14,
//                                                           right: 14),
//                                                       child: Column(
//                                                         crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                         children: [
//
//                                                           Padding(
//                                                             padding:
//                                                             const EdgeInsets
//                                                                 .only(
//                                                                 top:
//                                                                 15.0),
//                                                             child: Text(
//                                                               'Password',
//                                                               style: TextStyle(
//                                                                   color: Colors
//                                                                       .black45),
//                                                             ),
//                                                           ),
//                                                           Container(
//                                                             height: 45,
//                                                             child:
//                                                             TextFormField(
//                                                               controller: password,
//                                                               validator:
//                                                                   (value) {
//                                                                 if (value ==
//                                                                     null ||
//                                                                     value
//                                                                         .isEmpty) {
//                                                                   return 'Password is Required';
//                                                                 }
//                                                                 return null;
//                                                               },
//                                                               // controller: fullname,
//                                                               decoration:
//                                                               InputDecoration(
//                                                                 border:
//                                                                 UnderlineInputBorder(
//                                                                   borderSide: BorderSide(
//                                                                       color: Colors
//                                                                           .black26,
//                                                                       width: 1),
//                                                                 ),
//                                                                 focusedBorder:
//                                                                 UnderlineInputBorder(
//                                                                   borderSide: BorderSide(
//                                                                       color: Colors
//                                                                           .black26,
//                                                                       width: 1),
//                                                                 ),
//                                                                 enabledBorder:
//                                                                 UnderlineInputBorder(
//                                                                   borderSide: BorderSide(
//                                                                       color: Colors
//                                                                           .black26,
//                                                                       width: 1),
//                                                                 ),
//                                                                 hintStyle: TextStyle(
//                                                                     color: Colors
//                                                                         .black45),
//                                                                 hintText: "    password",
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     Align(
//                                                       alignment: Alignment
//                                                           .bottomCenter,
//                                                       child: Padding(
//                                                         padding:
//                                                         const EdgeInsets
//                                                             .only(
//                                                             top: 25.0,bottom: 0),
//                                                         child: ElevatedButton(
//                                                           style: ButtonStyle(
//                                                               elevation:
//                                                               MaterialStateProperty
//                                                                   .all(0),
//                                                               backgroundColor:
//                                                               MaterialStateProperty
//                                                                   .all(Color(
//                                                                   0xFFFF7711)),
//                                                               shape: MaterialStateProperty.all<
//                                                                   RoundedRectangleBorder>(
//                                                                   RoundedRectangleBorder(
//                                                                     borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                         10.0),
//                                                                   ))),
//                                                           child: Container(
//                                                             width: MediaQuery.of(
//                                                                 context)
//                                                                 .size
//                                                                 .width *
//                                                                 0.75,
//                                                             height: 50,
//                                                             alignment: Alignment
//                                                                 .center,
//                                                             decoration: BoxDecoration(
//                                                                 borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                     10)),
//                                                             child: authProvider.loading? SizedBox(
//                                                               child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
//                                                               height: 30.0,
//                                                               width: 30.0,
//                                                             ): Text(
//                                                               'Login to your account',
//                                                               style: TextStyle(
//                                                                   color: Colors
//                                                                       .white),
//                                                             ),
//                                                           ),
//                                                           onPressed:
//                                                               password.text.isEmpty?(){}:
//                                                               () {
//                                                             authProvider.setLoad();
//                                                             // verifyNumber();
//                                                             authProvider.login(
//                                                               // password: password.text,
//                                                               phone: authProvider.number,
//                                                               dialCode: authProvider.dialCode,
//                                                               context: context,
//                                                             );
//                                                             FocusScopeNode currentFocus = FocusScope.of(context);
//                                                             if (!currentFocus.hasPrimaryFocus){
//                                                               currentFocus.unfocus();
//                                                             }
//
//                                                             // authProvider.setLoad();
//
//
//
//                                                           },
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Align(
//                                                       alignment: Alignment
//                                                           .bottomCenter,
//                                                       child: Padding(
//                                                         padding:
//                                                         const EdgeInsets
//                                                             .only(
//                                                             top: 5.0,bottom: 60),
//                                                         child: ElevatedButton(
//                                                           style: ButtonStyle(
//                                                               elevation:
//                                                               MaterialStateProperty
//                                                                   .all(0),
//                                                               backgroundColor:
//                                                               MaterialStateProperty
//                                                                   .all(Colors.white),
//                                                               shape: MaterialStateProperty.all<
//                                                                   RoundedRectangleBorder>(
//                                                                   RoundedRectangleBorder(
//                                                                     borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                         10.0),
//                                                                   ))),
//                                                           child: Container(
//                                                             width: MediaQuery.of(
//                                                                 context)
//                                                                 .size
//                                                                 .width *
//                                                                 0.75,
//                                                             height: 50,
//                                                             alignment: Alignment
//                                                                 .center,
//                                                             decoration: BoxDecoration(
//                                                                 borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                     10)),
//                                                             child: authProvider.loading? SizedBox(
//                                                               child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
//                                                               height: 30.0,
//                                                               width: 30.0,
//                                                             ): Text(
//                                                               'Go back',
//                                                               style: TextStyle(
//                                                                   color: Colors
//                                                                       .black),
//                                                             ),
//                                                           ),
//                                                           onPressed:
//                                                               () {
//                                                           Navigator.pop(context);
//
//
//                                                           },
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
//
//
//   _onPressedShowBottomSheet() async {
//     AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: false);
//     final country = await showCountryPickerSheet(
//       context,
//     );
//     if (country != null) {
//
//       setState(() {
//         // Provider.of<AppData>(context).setCountryCode(country.callingCode);
//         _selectedCountry = country;
//         authProvider.setDialCode(_selectedCountry.countryCode.toString());
//       });
//     }
//   }
// }
