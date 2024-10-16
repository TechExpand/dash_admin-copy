import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:martline_admin/Model/accountModel.dart';
import 'package:martline_admin/Model/service.dart';
import 'package:martline_admin/Pages/userDetail.dart';
import 'package:martline_admin/Provider/AuthProvider.dart';
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
// import '../AdminEdit/VerificationDetail.dart';
import '../Model/shipmentModel.dart';
import '../Provider/AdvertProvider.dart';
import '../config/responsive.dart';
import '../style/colors.dart';
import 'DeliveryDetail.dart';
// import 'AdDetail.dart';
// import 'VerificationDetail.dart';

// getallearning
// getallusers

class AllUsers extends StatefulWidget {
  const AllUsers({Key? key}) : super(key: key);

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> with SingleTickerProviderStateMixin {
  List<userModel>? delivery;
  TabController? controller;
  List<userModel>? alldelivery;
  List<userModel>? alldeliveryfinal;
  List<userModel>? alldeliveryfinal2;
  List<userModel>? alldeliveryfinal3;
  String status = "All";
  String status2 = "approved";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(length: 2, vsync: this);
    AdvertService advertService =
    Provider.of<AdvertService>(context, listen: false);
    advertService.getUsers().then((value) {
      setState(() {
        delivery = value;
        alldelivery = value;
        print(delivery);
        // alladsfinal = value;
        alldeliveryfinal = delivery!.where((element) => element.accountType.toString().toLowerCase()=="user").toList();

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    AdvertService advertService =
    Provider.of<AdvertService>(context, listen: false);
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
                    Text(
                      "Dash Users",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Spacer(),
                    Expanded(
                      flex: Responsive.isDesktop(context) ? 1 : 3,
                      child: InkWell(
                        onTap: (){
                          result = advertService.alluserList;
                          userDialog(context);
                        },
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.white,
                              contentPadding:
                              EdgeInsets.only(left: 40.0, right: 5),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: AppColors.white),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: AppColors.white),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: AppColors.white),
                              ),
                              prefixIcon: Icon(Icons.search, color: AppColors.black),
                              hintText: 'Search User',
                              hintStyle: TextStyle(color: AppColors.secondary, fontSize: 14)
                          ),
                        ),
                      ),
                    ),
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
                          Padding(
                            padding: const EdgeInsets.only(right: 22.0, top: 10, bottom: 10),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Builder(builder: (context) {
                                var now = DateTime.now();
                                var now_1ys = now.subtract(Duration(days: 1));
                                var now_1w = now.subtract(Duration(days: 7));
                                var now_1m = DateTime(now.year, now.month - 1, now.day);
                                return Container(
                                  width: 100,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF9FAFB),
                                      border: Border.all(color: Color(0xFFD1D5DB)),
                                      borderRadius: BorderRadius.circular(4)),
                                  margin: const EdgeInsets.only(bottom: 0.0),
                                  child: PopupMenuButton<int>(
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context) => [
                                      // PopupMenuItem 1
                                      PopupMenuItem(
                                        onTap: () {
                                          setState(() {
                                            status = "All";
                                            // transaction = alltransaction!.where((element) => element.date=="").toList();
                                            delivery = alldelivery;
                                          });
                                        },
                                        value: 1,
                                        // row with 2 children
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text("All")
                                          ],
                                        ),
                                      ),
                                      // PopupMenuItem 2
                                      PopupMenuItem(
                                        onTap: () {
                                          setState(() {
                                            status = "Today";
                                            delivery = alldelivery!
                                                .where((element) =>
                                            now.year ==
                                                DateTime.parse(
                                                    element.joined.toString())
                                                    .year &&
                                                now.day ==
                                                    DateTime.parse(
                                                        element.joined.toString())
                                                        .day &&
                                                now.month ==
                                                    DateTime.parse(
                                                        element.joined.toString())
                                                        .month)
                                                .toList();
                                          });
                                        },
                                        value: 2,
                                        // row with two children
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text("Today")
                                          ],
                                        ),
                                      ),

                                      PopupMenuItem(
                                        onTap: () {
                                          setState(() {
                                            status = "This Yesterday";
                                            delivery = alldelivery!
                                                .where((element) => now_1ys.isBefore(
                                                DateTime.parse(
                                                    element.joined.toString())))
                                                .toList();
                                          });
                                        },
                                        value: 3,
                                        // row with two children
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text("Yesterday")
                                          ],
                                        ),
                                      ),

                                      PopupMenuItem(
                                        onTap: () {
                                          setState(() {
                                            status = "This week";
                                            delivery = alldelivery!
                                                .where((element) => now_1w.isBefore(
                                                DateTime.parse(
                                                    element.joined.toString())))
                                                .toList();
                                          });
                                        },
                                        value: 4,
                                        // row with two children
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text("This week")
                                          ],
                                        ),
                                      ),

                                      PopupMenuItem(
                                        onTap: () {
                                          setState(() {
                                            status = "This month";
                                            delivery = alldelivery!
                                                .where((element) => now_1m.isBefore(
                                                DateTime.parse(
                                                    element.joined.toString())))
                                                .toList();
                                          });
                                        },
                                        value: 5,
                                        // row with two children
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text("This month")
                                          ],
                                        ),
                                      ),
                                    ],
                                    icon: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        height: 32,
                                        // width: 90,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${status}  ",
                                              style: TextStyle(fontSize: 13),
                                            ),
                                            Image.asset("image/icon/calendar.png")
                                          ],
                                        ),
                                      ),
                                    ),
                                    elevation: 2,
                                    // on selected we show the dialog box
                                    onSelected: (value) {},
                                  ),
                                );
                              }),
                            ),
                          ),

                        ],
                      ),
                    ),

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
                              alldeliveryfinal = delivery!.where((element) => element.accountType.toString().toLowerCase()=="user").toList();

                              // _first = true;
                            });
                          } else if(value == 1) {
                            setState(() {
                              controller!.animateTo(1);
                              alldeliveryfinal = delivery!.where((element) => element.accountType.toString().toLowerCase()=="rider").toList();

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
                                  Text("Users "),
                                ],
                              )),
                          Tab(
                              child: Row(
                                children: [
                                  Text("Riders "),
                                ],
                              )),

                        ]),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.70,
                width: MediaQuery.of(context).size.width,
                child: alldeliveryfinal == null
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
                    : alldeliveryfinal!.isEmpty
                    ? Center(
                    child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
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
                                        'No Delivery',
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

                          ],
                        )))
                    : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: alldeliveryfinal!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return UserDetails(verification: alldeliveryfinal![index]);
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
        // .then((value) {
                          //   AdvertService advertService =
                          //   Provider.of<AdvertService>(context, listen: false);
                          //   advertService.getShipment().then((value) {
                          //     setState(() {
                          //       controller!.animateTo(0);
                          //       delivery = value;
                          //       alldelivery = value;
                          //       // alladsfinal = value;
                          //       alldeliveryfinal = delivery!.where((element) => element.status.toString().toLowerCase()=="pending").toList();
                          //
                          //     });
                          //   });
                          // });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0,
                              left: 20,
                              right: 20,
                              bottom: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.8,
                            height: 160,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        children: [
                                          Text("NGN ${alldeliveryfinal![index].status.toString()}",
                                            style: TextStyle(
                                                fontSize: 12
                                            ),),
                                          Spacer(),
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
                                                "${alldeliveryfinal![index].status}".capitalized(),
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
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("item name",  style: TextStyle(fontSize: 12, color: Colors.black38), ),
                                          Text("${alldeliveryfinal![index].surname}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                          Text("state",  style: TextStyle(fontSize: 12, color: Colors.black38),),
                                          Text("${alldeliveryfinal![index].email}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,),)
                                        ],
                                      ),
                                      // Spacer(),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("mode",  style: TextStyle(fontSize: 12, color: Colors.black38), ),
                                          Text("${alldeliveryfinal![index].joined}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                          Text("type",  style: TextStyle(fontSize: 12, color: Colors.black38),),
                                          Text("${alldeliveryfinal![index].status}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,),)
                                        ],
                                      ),

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





  List<userModel> result = [];
  void searchUser(userInputValue) {
    AdvertService advertService =
    Provider.of<AdvertService>(context, listen: false);
    result = advertService.alluserList
        .where((bank) => bank.surname.toString()
        .toLowerCase()
        .contains(userInputValue.toLowerCase())||bank.email.toString()
        .toLowerCase()
        .contains(userInputValue.toLowerCase()))
        .toList();
  }

  userDialog(ctx) {
    AdvertService advertService =
    Provider.of<AdvertService>(context, listen: false);
    showDialog(
        context: context,
        builder: (ctx) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setStates) {


              return AlertDialog(
                title: TextFormField(
                  onChanged: (value) {
                    setStates(() {
                      searchUser(value);
                    });
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Search User by username/email',
                    labelStyle: TextStyle(color: Colors.black),
                    disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 0.0),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 0.0),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 0.0),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ),
                content: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(new Radius.circular(50.0)),
                  ),
                  height: 500,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 300,
                          height: 500,
                          child: ListView.builder(
                            itemCount:  result.length,
                            itemBuilder: (context, index) {
                              result.sort((a, b) {
                                var ad = a.surname;
                                var bd = b.surname;
                                var s = ad!.compareTo(bd!);
                                return s;
                              });

                              return InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  // advertService
                                  //     .changeSelectedUser(result[index]);
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation, secondaryAnimation) {
                                        return UserDetails(verification: result[index]);
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
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Color(0xFF270F33)
                                        .withOpacity(0.6),
                                    child: Text(
                                        result[index]
                                            .surname.toString()
                                            .substring(0, 2),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  title: Text('${result[index].surname}',  style: TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),),
                                  subtitle: Text('${result[index].email}'),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }).then((v) {
      setState(() {

      });
    });
  }

}
