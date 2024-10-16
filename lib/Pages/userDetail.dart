import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:martline_admin/Model/accountModel.dart';
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
import '../Provider/AdvertProvider.dart';
import '../Provider/AuthProvider.dart';
import '../Widget/Circular.dart';
// import '../Provider/InvoiceProvider.dart';
// import 'dupicateAd.dart';

class UserDetails extends StatefulWidget {
  userModel? verification;

  UserDetails({this.verification});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  List<AdvertModel>? allads = [];
  List<AdvertModel>? ads = [];
  bool _first = true;
  String status = "Today";
  DateTime? start;
  DateTime? end;
  List<userModel>? adview;
  List<userModel>? alladview;
  List<userModel>? alladclick;
  List<userModel>? adclick;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(length: 2, vsync: this);
    AdvertService advertService =
    Provider.of<AdvertService>(context, listen: false);
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
                        "User Detail",
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
                            Text(
                              "",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "",
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Text("")
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
                    height: 150,
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
                                  Text("${widget.verification!.joined.toString()}",
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
                                        "${widget.verification!.status}".capitalized(),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("username",  style: TextStyle(fontSize: 12, color: Colors.black38), ),
                                  Text("${widget.verification!.surname}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                  Text("email",  style: TextStyle(fontSize: 12, color: Colors.black38),),
                                  Text("${widget.verification!.email}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,),)
                                ],
                              ),
                              // Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("joined",  style: TextStyle(fontSize: 12, color: Colors.black38), ),
                                  Text("${widget.verification!.joined}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                  // Text("type",  style: TextStyle(fontSize: 12, color: Colors.black38),),
                                  // Text("${widget.verification!.status}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,),)
                                ],
                              ),

                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                ),


                // Text(widget.ads!.id.toString()),

                widget.verification!.suspended.toString()=="true"?Padding(
                  padding: const EdgeInsets.only(left:20.0, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40.0, bottom: 60),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor: MaterialStateProperty.all(Color(0xFF1B9AAF)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ))),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 50,
                              alignment: Alignment.center,
                              decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'Unsuspend User',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onPressed:
                                (){
                                  AdvertService advertService =
                                  Provider.of<AdvertService>(context, listen: false);

                                  circularCustom(context);
                                  advertService.updateSuspention(
                                      widget.verification!.id,
                                      false,
                                      context
                                  ).then((value){
                                    Navigator.pop(context);
                                    if(value){
                                      setState(() {
                                        widget.verification!.suspended=="false";
                                      });
                                    }
                                  });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ):

                Padding(
                  padding: const EdgeInsets.only(left:20.0, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40.0, bottom: 60),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor: MaterialStateProperty.all(Color(0xFF1B9AAF)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ))),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 50,
                              alignment: Alignment.center,
                              decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'Suspend User',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onPressed:
                                (){

                              AdvertService advertService =
                              Provider.of<AdvertService>(context, listen: false);

                              circularCustom(context);
                              advertService.updateSuspention(
                                  widget.verification!.id,
                                  true,
                                  context
                              ).then((value){
                                Navigator.pop(context);
                                if(value){
                                  setState(() {
                                    widget.verification!.suspended=="true";
                                  });
                                }
                              });

                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


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
