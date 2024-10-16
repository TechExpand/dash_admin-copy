import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:martline_admin/utils.dart';
// import 'package:matl/
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

// import '../../Firebase/Utils/utils.dart';
import '../../Model/AdvertModel.dart';
import '../../Model/Transactions.dart';
import '../../Model/service.dart';
import '../../Widget/chart.dart';
import '../../Widget/sheet.dart';
import '../../constant/color.dart';
import '../Model/Earning.dart';
import '../Model/delivery.dart';
import '../Model/shipmentModel.dart';
import '../Provider/AdvertProvider.dart';
import '../Provider/AuthProvider.dart';
import '../Widget/Circular.dart';
// import '../Provider/InvoiceProvider.dart';
// import 'dupicateAd.dart';

class EarningDetails extends StatefulWidget {
  EarningModel? delivery;

  EarningDetails({this.delivery});

  @override
  State<EarningDetails> createState() => _EarningDetailssState();
}

class _EarningDetailssState extends State<EarningDetails>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  List<AdvertModel>? allads = [];
  List<AdvertModel>? ads = [];
  bool _first = true;
  String status = "Today";
  DateTime? start;
  DateTime? end;
  List<AdViewModel>? adview;
  List<AdViewModel>? alladview;
  List<AdViewModel>? alladclick;
  List<AdViewModel>? adclick;
  List<DeliveryLocationModel>? delivery;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(length: 2, vsync: this);
    AdvertService advertService =
    Provider.of<AdvertService>(context, listen: false);

    advertService.getDeliveryLocation(
        widget.delivery!.id
    )
        .then((e){
      setState((){
        delivery = e;
        // print(delivery);
      });
    });
  }





  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
    Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: bgColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 0, right: 0),
          child: SingleChildScrollView(
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
                        "Delivery",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
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

                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0,
                      left: 20,
                      right: 20,
                      bottom: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 150,
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
                                  Text("NGN ${widget.delivery!.amount.toString()}",
                                    style: TextStyle(
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
                                        "${widget.delivery!.date}".capitalized(),
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
                                  Text("Name",  style: TextStyle(fontSize: 12, color: Colors.black38), ),
                                  Text("${widget.delivery!.user!["surname"]}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                  Text("Email",  style: TextStyle(fontSize: 12, color: Colors.black38),),
                                  Text("${widget.delivery!.user["email"]}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,),)
                                ],
                              ),
                              // Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Percent",  style: TextStyle(fontSize: 12, color: Colors.black38), ),
                                  Text("${widget.delivery!.amount}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                  // Text("type",  style: TextStyle(fontSize: 12, color: Colors.black38),),
                                  // Text("${widget.delivery!.shipType}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,),)
                                ],
                              ),

                            ],
                          ),



                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, top: 10),
                            child: Text("Sender's Info",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1B9AAF))),
                          ),

                          delivery ==null?Center(child: CupertinoActivityIndicator()):Column(
                              children: [
                                ...delivery!.map((e) {
                                  return  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 22.0, top: 10),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Pickup Location: ${e.pickup}",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11
                                            ),
                                          ),
                                        ),
                                      ),

                                      Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 22.0, top: 10),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Pickup Name: ${e.senderName}",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 11
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 22.0, top: 10),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Pickup phone: ${e.senderPhone}",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 11
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:5.0),
                                        child: Divider(),
                                      ),
                                    ],
                                  );
                                })
                              ]
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, top: 15),
                            child: Text("Reciever's Info",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1B9AAF))),
                          ),
                          delivery ==null?Center(child: CupertinoActivityIndicator()):  Column(
                            children:[

                              ...delivery!.map((e){
                                return  Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 22.0, top: 10),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Dropoff Location: ${e.dropoff}",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(left: 22.0, top: 10),
                                    //   child: Align(
                                    //     alignment: Alignment.topLeft,
                                    //     child: Text(
                                    //       "Landmark: ${e.droplandmark}",
                                    //       style: TextStyle(
                                    //           color: Colors.black54,
                                    //           fontWeight: FontWeight.bold,
                                    //           fontSize: 13
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 22.0, top: 10),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Dropoff Name: ${e.recieverName}",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11
                                                ),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 22.0, top: 10),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Dropoff phone: ${e.recieverPhone}",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top:5.0),
                                      child: Divider(),
                                    ),
                                  ],
                                );
                              })
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),


                // Text(widget.ads!.id.toString()),



                Container(),


              ],
            ),
          ),
        ),
      ),
    );
  }



  formatDate(DateTime now) {
    final DateFormat formatter = DateFormat('dd MMMM yyyy');
    final String formatted = formatter.format(now);
    return formatted;
  }

  formatDate2(
      DateTime now,
      now2,
      ) {
    final DateFormat formatter1 = DateFormat('MM. dd');
    final String formatted1 = formatter1.format(now);

    final DateFormat formatter2 = DateFormat('MM. dd yyyy');
    final String formatted2 = formatter2.format(now);
    return "${formatted1} - ${formatted2}";
  }
}
