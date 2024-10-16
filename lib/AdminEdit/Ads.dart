import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:martline_admin/utils.dart';
// import 'package:matline/Module/Account/TransactionHistory/transactionDetail.dart';
// import 'package:matline/Module/Provider/AdvertProvider.dart';
// import 'package:matline/utils.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

// import '../../Firebase/Utils/utils.dart';
import '../../Model/AdvertModel.dart';
import '../../Model/Transactions.dart';
import '../../constant/color.dart';
// import '../Provider/InvoiceProvider.dart';
import '../Provider/AdvertProvider.dart';
import 'AdDetail.dart';

class MerchantAdvert extends StatefulWidget {
  const MerchantAdvert({Key? key}) : super(key: key);

  @override
  State<MerchantAdvert> createState() => _MerchantAdvertState();
}

class _MerchantAdvertState extends State<MerchantAdvert> with SingleTickerProviderStateMixin {
  List<AdvertModel>? ads;
  TabController? controller;
  List<AdvertModel>? allads;
  List<AdvertModel>? alladsfinal;
  String status = "All";
  String status2 = "approved";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(length: 2, vsync: this);
    AdvertService advertService =
    Provider.of<AdvertService>(context, listen: false);
    advertService.getAdvert().then((value) {
      setState(() {
        ads = value;
        allads = value;
        // alladsfinal = value;
        alladsfinal = ads!.where((element) => element.status.toString().toLowerCase()=="pending").toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: bgColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 0, right: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.arrow_back,
                          size: 23,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        "Martline Ads",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Spacer(),
                    Text("")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 22.0, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, top: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Martline Ads",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                         
                        ],
                      ),
                    ),
                    Spacer(),

                    // Align(
                    //   alignment: Alignment.bottomRight,
                    //   child: Builder(builder: (context) {
                    //     var now = DateTime.now();
                    //     var now_1ys = now.subtract(Duration(days: 1));
                    //     var now_1w = now.subtract(Duration(days: 7));
                    //     var now_1m = DateTime(now.year, now.month - 1, now.day);
                    //     return Container(
                    //       width: 100,
                    //       height: 32,
                    //       decoration: BoxDecoration(
                    //           color: Color(0xFFF9FAFB),
                    //           border: Border.all(color: Color(0xFFD1D5DB)),
                    //           borderRadius: BorderRadius.circular(4)),
                    //       margin: const EdgeInsets.only(bottom: 0.0),
                    //       child: PopupMenuButton<int>(
                    //         padding: EdgeInsets.zero,
                    //         itemBuilder: (context) => [
                    //           // PopupMenuItem 1
                    //           PopupMenuItem(
                    //             onTap: () {
                    //               setState(() {
                    //                 status = "All";
                    //                 // transaction = alltransaction!.where((element) => element.date=="").toList();
                    //                 ads = allads;
                    //                 alladsfinal = ads!.where((element) => element.status.toString().toLowerCase()==status2).toList();
                    //               });
                    //             },
                    //             value: 1,
                    //             // row with 2 children
                    //             child: Row(
                    //               children: [
                    //                 SizedBox(
                    //                   width: 5,
                    //                 ),
                    //                 Text("All")
                    //               ],
                    //             ),
                    //           ),
                    //           // PopupMenuItem 2
                    //           PopupMenuItem(
                    //             onTap: () {
                    //               setState(() {
                    //                 status = "Today";
                    //                 ads = allads!
                    //                     .where((element) =>
                    //                 now.year ==
                    //                     DateTime.parse(element.startDate
                    //                         .toString())
                    //                         .year &&
                    //                     now.day ==
                    //                         DateTime.parse(element.startDate
                    //                             .toString())
                    //                             .day &&
                    //                     now.month ==
                    //                         DateTime.parse(element.startDate
                    //                             .toString())
                    //                             .month)
                    //                     .toList();
                    //
                    //                 alladsfinal = ads!.where((element) => element.status.toString().toLowerCase()==status2).toList();
                    //               });
                    //             },
                    //             value: 2,
                    //             // row with two children
                    //             child: Row(
                    //               children: [
                    //                 SizedBox(
                    //                   width: 5,
                    //                 ),
                    //                 Text("Today")
                    //               ],
                    //             ),
                    //           ),
                    //
                    //           PopupMenuItem(
                    //             onTap: () {
                    //               setState(() {
                    //                 status = "This Yesterday";
                    //                 ads = allads!
                    //                     .where((element) => now_1ys.isBefore(
                    //                     DateTime.parse(
                    //                         element.startDate.toString())))
                    //                     .toList();
                    //                 alladsfinal = ads!.where((element) => element.status.toString().toLowerCase()==status2).toList();
                    //               });
                    //             },
                    //             value: 3,
                    //             // row with two children
                    //             child: Row(
                    //               children: [
                    //                 SizedBox(
                    //                   width: 5,
                    //                 ),
                    //                 Text("Yesterday")
                    //               ],
                    //             ),
                    //           ),
                    //
                    //           PopupMenuItem(
                    //             onTap: () {
                    //               setState(() {
                    //                 status = "This week";
                    //                 ads = allads!
                    //                     .where((element) => now_1w.isBefore(
                    //                     DateTime.parse(
                    //                         element.startDate.toString())))
                    //                     .toList();
                    //                 alladsfinal = ads!.where((element) => element.status.toString().toLowerCase()==status2).toList();
                    //               });
                    //             },
                    //             value: 4,
                    //             // row with two children
                    //             child: Row(
                    //               children: [
                    //                 SizedBox(
                    //                   width: 5,
                    //                 ),
                    //                 Text("This week")
                    //               ],
                    //             ),
                    //           ),
                    //
                    //           PopupMenuItem(
                    //             onTap: () {
                    //               setState(() {
                    //                 status = "This month";
                    //                 ads = allads!
                    //                     .where((element) => now_1m.isBefore(
                    //                     DateTime.parse(
                    //                         element.startDate.toString())))
                    //                     .toList();
                    //                 alladsfinal = ads!.where((element) => element.status.toString().toLowerCase()==status2).toList();
                    //
                    //               });
                    //             },
                    //             value: 5,
                    //             // row with two children
                    //             child: Row(
                    //               children: [
                    //                 SizedBox(
                    //                   width: 5,
                    //                 ),
                    //                 Text("This month")
                    //               ],
                    //             ),
                    //           ),
                    //         ],
                    //         icon: Align(
                    //           alignment: Alignment.bottomRight,
                    //           child: Container(
                    //             height: 32,
                    //             // width: 90,
                    //             child: Row(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               crossAxisAlignment: CrossAxisAlignment.center,
                    //               children: [
                    //                 Text(
                    //                   "${status}  ",
                    //                   style: TextStyle(fontSize: 13),
                    //                 ),
                    //                 Image.asset("image/icon/calendar.png")
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //         elevation: 2,
                    //         // on selected we show the dialog box
                    //         onSelected: (value) {},
                    //       ),
                    //     );
                    //   }),
                    // ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.only(left: 25, right: 25),

                  // width: MediaQuery.of(context).size.width * 0.9,
                  //This is responsible for the background of the tabbar, does the magic
                  decoration: BoxDecoration(
                    //This is for background color
                      color: Colors.white,
                      //This is for bottom border that is needed
                      border: Border(
                          bottom: BorderSide(color: Colors.black26, width: 0.2))),
                  child: Center(
                    child: TabBar(
                        onTap: (value) {
                          if (value == 0) {
                            setState(() {
                              controller!.animateTo(0);
                              alladsfinal = ads!.where((element) => element.status.toString().toLowerCase()=="pending").toList();
                              // _first = true;
                            });
                          } else {
                            setState(() {
                              controller!.animateTo(1);
                              alladsfinal = ads!.where((element) => element.status.toString().toLowerCase()!="pending").toList();
                              // _first = false;
                            });
                          }
                        },
                        indicatorColor: clrOrange,
                        indicatorWeight: 4,
                        labelStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black45,
                        unselectedLabelStyle: TextStyle(color: Colors.black45),
                        controller: controller,
                        tabs: [
                          Tab(
                              child: Row(
                                children: [
                                  Text("Pending "),
                                ],
                              )),
                          Tab(
                              child: Row(
                                children: [
                                  Text("Approved "),
                                ],
                              )),
                        ]),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.72,
                width: MediaQuery.of(context).size.width,
                child: alladsfinal == null
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
                    : alladsfinal!.isEmpty
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
                                        'No Ads',
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
                    itemCount: alladsfinal!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return AdvertDetails(ads: alladsfinal![index]);
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          ).then((value){
                            AdvertService advertService =
                            Provider.of<AdvertService>(context, listen: false);
                            advertService.getAdvert().then((value) {
                              setState(() {
                                controller!.animateTo(0);
                                ads = value;
                                allads = value;
                                // alladsfinal = value;
                                alladsfinal = ads!.where((element) => element.status.toString().toLowerCase()=="pending").toList();
                              });
                            });
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0,
                              left: 20,
                              right: 20,
                              bottom: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.8,
                            height: 210,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image.network(alladsfinal![index].image![0].toString(),
                                        fit: BoxFit.fill,),
                                    ),
                                    width: MediaQuery.of(context).size.width*0.84,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        children: [
                                          Text("${formatDate2(DateTime.parse(alladsfinal![index].startDate.toString()),
                                              DateTime.parse(alladsfinal![index].endDate.toString()))}", style: TextStyle(
                                              fontSize: 12
                                          ),),
                                          Container(
                                            margin: EdgeInsets
                                                .only(
                                                left: 10),
                                            height: 20,
                                            width: 70,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    20),
                                                color: Color(0xFFC7EFD7)),
                                            child: Center(
                                              child: Text(
                                                "${alladsfinal![index].status}".capitalized(),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color:Color(0xFF02A486)),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Divider(thickness: 1,),
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text("Views",  style: TextStyle(fontSize: 12, color: Colors.black38),),
                                          Text("${alladsfinal![index].views==0?"-":alladsfinal![index].views}", style: TextStyle(fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                      SizedBox(width: 30,),
                                      Column(
                                        children: [
                                          Text("Clicks", style: TextStyle(fontSize: 12, color: Colors.black38),),
                                          Text("${alladsfinal![index].clicks==0?"-":alladsfinal![index].clicks}", style: TextStyle(fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                      Spacer(),
                                      Container(
                                          width: 100,
                                          height: 35,
                                          decoration:
                                          BoxDecoration(
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                5),
                                            color:
                                            clrOrange,
                                          ),
                                          child: Center(
                                              child: Text(
                                                "View Ad",
                                                style: TextStyle(

                                                    color: Colors
                                                        .white),
                                              ))),
                                    ],
                                  )

                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  formatDate(DateTime now) {
    final DateFormat formatter = DateFormat('EEEE, dd MMMM yyyy');
    final String formatted = formatter.format(now);
    return formatted;
  }

  formatDate2(DateTime now, now2,) {
    final DateFormat formatter1 = DateFormat('MMM. dd');
    final String formatted1 = formatter1.format(now);

    final DateFormat formatter2 = DateFormat('MMM. dd yyyy');
    final String formatted2 = formatter2.format(now);
    return "${formatted1} - ${formatted2}";
  }
}
