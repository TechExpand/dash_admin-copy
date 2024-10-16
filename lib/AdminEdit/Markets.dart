// import 'package:coin_mika/Screen/Home/CoinDetail.dart';

import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/material.dart';
import 'package:martline_admin/AdminCreate/createMarket.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';



import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../Model/service.dart';
import '../../../Widget/sheet.dart';
import '../../../constant/color.dart';
import '../Provider/AuthProvider.dart';




class Market extends StatefulWidget {
  const Market({Key? key}) : super(key: key);

  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> with TickerProviderStateMixin {
  double portforlioHeight = 55.0;
  int currentindex = 0;
  TabController? tabController;

  String storeName = "";



  List<Services> storeType = [
    Services(title: "WholeSale"),
    Services(title: "Retail"),
  ];

  Services ?selectedStoreType;



  @override
  void initState() {
    AuthProvider authProvider = Provider.of<AuthProvider>(context, listen:false);
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 5,
      vsync: this,
    );
    authProvider.setMarketNull();
    authProvider.setState(authProvider.states[0]);
    authProvider.getMarkets();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: DefaultTabController(
          length: 5,
          child: Container(
            child: SingleChildScrollView(
              // physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                 
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 0),
                      child: Container(
                        margin: EdgeInsets.only(top: 0),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            )),
                        child: SingleChildScrollView(
                          // physics: NeverScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding:
                                  EdgeInsets.only(top: 25, bottom: 0),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        padding: EdgeInsets.all(5),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.arrow_back,
                                            color: Colors.black),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder:
                                                  (context, animation, secondaryAnimation) {
                                                return CreateMarket();
                                              },
                                              transitionsBuilder: (context, animation,
                                                  secondaryAnimation, child) {
                                                return FadeTransition(
                                                  opacity: animation,
                                                  child: child,
                                                );
                                              },
                                            ),
                                          );
                                        },
                                        child: Container(
                                          margin: EdgeInsets
                                              .only(
                                              left: 10, right:10),
                                          height: 35,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(
                                                  20),
                                              color: Colors.grey),
                                          child: Center(
                                            child: Text(
                                              "Create market",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color:Colors.black),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Market",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 27),
                                          )),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(top: 8.0),
                                        child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Martline Market",
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontSize: 14),
                                            )),
                                      ),
                                      SingleChildScrollView(
                                        child: Column(
                                          children: [

                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 8.0,
                                                  bottom: 8,
                                                  left: 14,
                                                  right: 14),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [

                                                  Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        top:
                                                        15.0),
                                                    child: Text(
                                                      'State',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .black45),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap:(){

                                                      var authProvider = Provider.of<AuthProvider>(context, listen: false);
                                                      // authProvider.getCategory();
                                                      // authProvider.getMarkets();

                                                      showBottomSheetSelector(context,
                                                          "state",
                                                          onChanged: (index, items){

                                                            authProvider.setState(items[index]);
                                                            authProvider.setMarketNull();
                                                            authProvider.getMarkets();
                                                            Navigator.pop(context);
                                                          },

                                                          items: authProvider.states);
                                                    },
                                                    child: Container(
                                                      height: 45,
                                                      child:
                                                      TextFormField(
                                                        enabled: false,
                                                        validator:
                                                            (value) {
                                                          if (value ==
                                                              null ||
                                                              value
                                                                  .isEmpty) {
                                                            return 'Market is Required';
                                                          }
                                                          return null;
                                                        },
                                                        // controller: fullname,
                                                        decoration:
                                                        InputDecoration(
                                                          suffixIcon: Icon(Icons.keyboard_arrow_down_rounded,
                                                            size: 30,),
                                                          border:
                                                          UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .black26,
                                                                width: 1),
                                                          ),
                                                          focusedBorder:
                                                          UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .black26,
                                                                width: 1),
                                                          ),
                                                          enabledBorder:
                                                          UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .black26,
                                                                width: 1),
                                                          ),
                                                          hintStyle: TextStyle(
                                                            color: Colors
                                                                .black45,
                                                            fontSize: 13,
                                                          ),
                                                          hintText: "    ${authProvider.selectedState==null?"Select state":"${authProvider.selectedState!.title}"}",
                                                        ),
                                                      ),
                                                    ),
                                                  ),




                                                  Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        top:
                                                        20.0),
                                                    child: Text(
                                                      'Market',
                                                      style: TextStyle(

                                                          color: Colors
                                                              .black45),
                                                    ),
                                                  ),

                                                  Container(
                                                    height: MediaQuery.of(context).size.height * 0.65,
                                                    width: MediaQuery.of(context).size.width,
                                                    child: authProvider.market == null
                                                        ? SingleChildScrollView(
                                                      physics: BouncingScrollPhysics(),
                                                      child: Column(
                                                        children: [
                                                          Shimmer.fromColors(
                                                            baseColor: Color(0xFFf2f2f2),
                                                            highlightColor: Color(0xFFd9dadd),
                                                            enabled: true,
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.circular(15),
                                                              child: Container(
                                                                margin: const EdgeInsets.only(
                                                                    top: 12.0, left: 8, right: 8, bottom: 0),
                                                                padding: const EdgeInsets.only(
                                                                    top: 12.0, left: 8, right: 8, bottom: 8),
                                                                child: Card(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Column(
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            Column(
                                                                              crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                              mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "e.name.toString()",
                                                                                      style: TextStyle(
                                                                                          fontSize: 18),
                                                                                    ),
                                                                                    Image.asset(
                                                                                        "image/greenVerify.png")
                                                                                  ],
                                                                                ),
                                                                                Text(
                                                                                    "The best electronics shopin the worlds")
                                                                              ],
                                                                            ),
                                                                            Spacer(),
                                                                            Icon(
                                                                              Icons
                                                                                  .keyboard_arrow_up_outlined,
                                                                              size: 34,
                                                                            )
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Container(
                                                                                width: 90,
                                                                                height: 22,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius:
                                                                                    BorderRadius.circular(
                                                                                        50),
                                                                                    color: Color(0xFFECFDF3)),
                                                                                child: Center(
                                                                                    child: Text(
                                                                                      "e.storeType.toString()",
                                                                                      style: TextStyle(
                                                                                          fontWeight:
                                                                                          FontWeight.bold,
                                                                                          color:
                                                                                          Color(0xFF02A486)),
                                                                                    ))),
                                                                            Spacer(),
                                                                            Container(
                                                                                width: 100,
                                                                                height: 35,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius:
                                                                                  BorderRadius.circular(
                                                                                      5),
                                                                                  color: clrOrange,
                                                                                ),
                                                                                child: Center(
                                                                                    child: Text(
                                                                                      "View shop",
                                                                                      style: TextStyle(
                                                                                          fontWeight:
                                                                                          FontWeight.bold,
                                                                                          color: Colors.white),
                                                                                    ))),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                          const EdgeInsets.only(top: 5.0),
                                                                          child: Divider(),
                                                                        ),
                                                                        Container(height: 60, child: Text(""))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Shimmer.fromColors(
                                                            baseColor: Color(0xFFf2f2f2),
                                                            highlightColor: Color(0xFFd9dadd),
                                                            enabled: true,
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.circular(15),
                                                              child: Container(
                                                                margin: const EdgeInsets.only(
                                                                    top: 12.0, left: 8, right: 8, bottom: 0),
                                                                padding: const EdgeInsets.only(
                                                                    top: 12.0, left: 8, right: 8, bottom: 8),
                                                                child: Card(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Column(
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            Column(
                                                                              crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                              mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "e.name.toString()",
                                                                                      style: TextStyle(
                                                                                          fontSize: 18),
                                                                                    ),
                                                                                    Image.asset(
                                                                                        "image/greenVerify.png")
                                                                                  ],
                                                                                ),
                                                                                Text(
                                                                                    "The best electronics shopin the worlds")
                                                                              ],
                                                                            ),
                                                                            Spacer(),
                                                                            Icon(
                                                                              Icons
                                                                                  .keyboard_arrow_up_outlined,
                                                                              size: 34,
                                                                            )
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Container(
                                                                                width: 90,
                                                                                height: 22,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius:
                                                                                    BorderRadius.circular(
                                                                                        50),
                                                                                    color: Color(0xFFECFDF3)),
                                                                                child: Center(
                                                                                    child: Text(
                                                                                      "e.storeType.toString()",
                                                                                      style: TextStyle(
                                                                                          fontWeight:
                                                                                          FontWeight.bold,
                                                                                          color:
                                                                                          Color(0xFF02A486)),
                                                                                    ))),
                                                                            Spacer(),
                                                                            Container(
                                                                                width: 100,
                                                                                height: 35,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius:
                                                                                  BorderRadius.circular(
                                                                                      5),
                                                                                  color: clrOrange,
                                                                                ),
                                                                                child: Center(
                                                                                    child: Text(
                                                                                      "View shop",
                                                                                      style: TextStyle(
                                                                                          fontWeight:
                                                                                          FontWeight.bold,
                                                                                          color: Colors.white),
                                                                                    ))),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                          const EdgeInsets.only(top: 5.0),
                                                                          child: Divider(),
                                                                        ),
                                                                        Container(height: 60, child: Text(""))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Shimmer.fromColors(
                                                            baseColor: Color(0xFFf2f2f2),
                                                            highlightColor: Color(0xFFd9dadd),
                                                            enabled: true,
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.circular(15),
                                                              child: Container(
                                                                margin: const EdgeInsets.only(
                                                                    top: 12.0, left: 8, right: 8, bottom: 0),
                                                                padding: const EdgeInsets.only(
                                                                    top: 12.0, left: 8, right: 8, bottom: 8),
                                                                child: Card(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Column(
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            Column(
                                                                              crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                              mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "e.name.toString()",
                                                                                      style: TextStyle(
                                                                                          fontSize: 18),
                                                                                    ),
                                                                                    Image.asset(
                                                                                        "image/greenVerify.png")
                                                                                  ],
                                                                                ),
                                                                                Text(
                                                                                    "The best electronics shopin the worlds")
                                                                              ],
                                                                            ),
                                                                            Spacer(),
                                                                            Icon(
                                                                              Icons
                                                                                  .keyboard_arrow_up_outlined,
                                                                              size: 34,
                                                                            )
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Container(
                                                                                width: 90,
                                                                                height: 22,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius:
                                                                                    BorderRadius.circular(
                                                                                        50),
                                                                                    color: Color(0xFFECFDF3)),
                                                                                child: Center(
                                                                                    child: Text(
                                                                                      "e.storeType.toString()",
                                                                                      style: TextStyle(
                                                                                          fontWeight:
                                                                                          FontWeight.bold,
                                                                                          color:
                                                                                          Color(0xFF02A486)),
                                                                                    ))),
                                                                            Spacer(),
                                                                            Container(
                                                                                width: 100,
                                                                                height: 35,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius:
                                                                                  BorderRadius.circular(
                                                                                      5),
                                                                                  color: clrOrange,
                                                                                ),
                                                                                child: Center(
                                                                                    child: Text(
                                                                                      "View shop",
                                                                                      style: TextStyle(
                                                                                          fontWeight:
                                                                                          FontWeight.bold,
                                                                                          color: Colors.white),
                                                                                    ))),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                          const EdgeInsets.only(top: 5.0),
                                                                          child: Divider(),
                                                                        ),
                                                                        Container(height: 60, child: Text(""))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                        : authProvider.market!.isEmpty
                                                        ? Center(
                                                        child: Center(
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: 30,
                                                                ),
                                                                Image.asset("image/empty.png"),
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width,
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      // SizedBox(
                                                                      //   width: MediaQuery.of(context).size.width*0.3,
                                                                      // ),

                                                                      Padding(
                                                                        padding: const EdgeInsets.only(
                                                                          top: 25.0,
                                                                        ),
                                                                        child: Container(
                                                                          width:
                                                                          MediaQuery.of(context).size.width *
                                                                              0.8,
                                                                          child: Text(
                                                                            'No Market',
                                                                            textAlign: TextAlign.center,
                                                                            style: TextStyle(
                                                                                fontSize: 18,
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                  const EdgeInsets.only(top: 15.0, left: 10),
                                                                  child: Container(
                                                                    width:
                                                                    MediaQuery.of(context).size.width * 0.8,
                                                                    child: Text(
                                                                      'When customers request invoice for products in your store, you’ll see them here',
                                                                      style: TextStyle(
                                                                          fontSize: 16, color: Colors.black54),
                                                                      textAlign: TextAlign.center,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )))
                                                        : ListView.builder(
                                                        physics: BouncingScrollPhysics(),
                                                        itemCount: authProvider.market!.length,
                                                        itemBuilder: (context, index) {
                                                          return InkWell(
                                                            onTap: () {
                                                              // Navigator.push(
                                                              //   context,
                                                              //   PageRouteBuilder(
                                                              //     pageBuilder:
                                                              //         (context, animation, secondaryAnimation) {
                                                              //       return AdvertDetails(ads: ads![index]);
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
                                                            child: Padding(
                                                              padding: const EdgeInsets.only(
                                                                  top: 10.0,
                                                                  left: 20,
                                                                  right: 20,
                                                                  bottom: 10),
                                                              child:ListTile(
                                                                title: Text("${authProvider.market![index].title}"),
                                                                leading: Icon(Icons.shopping_bag_outlined),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                  ),





                                                ],
                                              ),
                                            ),
                                          ],
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
          ),
        ));
  }
}
