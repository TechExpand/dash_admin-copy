import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

class AdvertDetails extends StatefulWidget {
  AdvertModel? ads;

  AdvertDetails({this.ads});

  @override
  State<AdvertDetails> createState() => _AdvertDetailsState();
}

class _AdvertDetailsState extends State<AdvertDetails>
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


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(length: 2, vsync: this);
    AdvertService advertService =
    Provider.of<AdvertService>(context, listen: false);
    advertService.getAdView(widget.ads!.id).then((value) {
      setState(() {
        adview = value;
        alladview = value;
      });
    });

    advertService.getAdClick(widget.ads!.id).then((value) {
      setState(() {
        adclick = value;
        alladclick = value;
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
                        "All Ads",
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
                              "Ad performance",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "See how your Ads is doing on martlines",
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
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 20, right: 20, bottom: 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 170,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10)),
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
                                child: Image.network(
                                  widget.ads!.image![0].toString(),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.84,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20.0, bottom: 5),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    Text(
                                      "${formatDate2(DateTime.parse(widget.ads!.startDate.toString()), DateTime.parse(widget.ads!.endDate.toString()))}",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      height: 20,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xFFC7EFD7)),
                                      child: Center(
                                        child: Text(
                                          "${widget.ads!.status}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF02A486)),
                                        ),
                                      ),
                                    )
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
                Container(
                  color: Color(0xFFf3f4f6),
                  // height: MediaQuery.of(context).size.height*0.45,
                  width: MediaQuery.of(context).size.width,
                  child:adview==null&&adclick==null
                      ? ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
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
                                                  style: TextStyle(fontSize: 18),
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
                                          Icons.keyboard_arrow_up_outlined,
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
                                                BorderRadius.circular(50),
                                                color: Color(0xFFECFDF3)),
                                            child: Center(
                                                child: Text(
                                                  "e.storeType.toString()",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Color(0xFF02A486)),
                                                ))),
                                        Spacer(),
                                        Container(
                                            width: 100,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              color: clrOrange,
                                            ),
                                            child: Center(
                                                child: Text(
                                                  "View shop",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white),
                                                ))),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
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
                                                  style: TextStyle(fontSize: 18),
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
                                          Icons.keyboard_arrow_up_outlined,
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
                                                BorderRadius.circular(50),
                                                color: Color(0xFFECFDF3)),
                                            child: Center(
                                                child: Text(
                                                  "e.storeType.toString()",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Color(0xFF02A486)),
                                                ))),
                                        Spacer(),
                                        Container(
                                            width: 100,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              color: clrOrange,
                                            ),
                                            child: Center(
                                                child: Text(
                                                  "View shop",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white),
                                                ))),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
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
                                                  style: TextStyle(fontSize: 18),
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
                                          Icons.keyboard_arrow_up_outlined,
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
                                                BorderRadius.circular(50),
                                                color: Color(0xFFECFDF3)),
                                            child: Center(
                                                child: Text(
                                                  "e.storeType.toString()",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Color(0xFF02A486)),
                                                ))),
                                        Spacer(),
                                        Container(
                                            width: 100,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              color: clrOrange,
                                            ),
                                            child: Center(
                                                child: Text(
                                                  "View shop",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white),
                                                ))),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
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
                  )
                      :
                  ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: [
                      AnimatedCrossFade(
                        duration: const Duration(milliseconds: 800),
                        firstChild: adview==null&&adclick==null?Container():SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 22.0, top: 0, left: 22),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0.0, top: 5),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [Text("Filter date")],
                                      ),
                                    ),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Builder(builder: (context) {
                                        var now = DateTime.now();
                                        var now_1ys =
                                        now.subtract(Duration(days: 1));
                                        var now_1w =
                                        now.subtract(Duration(days: 7));
                                        var now_1m = DateTime(
                                            now.year, now.month - 1, now.day);
                                        return Container(
                                          width: 100,
                                          height: 32,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFF9FAFB),
                                              border: Border.all(
                                                  color: Color(0xFFD1D5DB)),
                                              borderRadius:
                                              BorderRadius.circular(4)),
                                          margin:
                                          const EdgeInsets.only(bottom: 0.0),
                                          child: PopupMenuButton<int>(
                                            padding: EdgeInsets.zero,
                                            itemBuilder: (context) => [
                                              // PopupMenuItem 2
                                              PopupMenuItem(
                                                onTap: () {
                                                  setState(() {
                                                    status = "Today";
                                                    adview = alladview!
                                                        .where((element) =>
                                                    now.year ==
                                                        DateTime.parse(element
                                                            .date
                                                            .toString())
                                                            .year &&
                                                        now.day ==
                                                            DateTime.parse(element
                                                                .date
                                                                .toString())
                                                                .day &&
                                                        now.month ==
                                                            DateTime.parse(element
                                                                .date
                                                                .toString())
                                                                .month)
                                                        .toList();

                                                  });
                                                  print(adview!.length);
                                                  print(adview!.length);
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
                                                    status = "Yesterday";
                                                    adview = alladview!
                                                        .where((element) => now_1ys
                                                        .isBefore(DateTime
                                                        .parse(element
                                                        .date
                                                        .toString())))
                                                        .toList();
                                                    print(adview!.length);
                                                    print(adview!.length);
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
                                                    adview = alladview!
                                                        .where((element) => now_1w
                                                        .isBefore(DateTime
                                                        .parse(element
                                                        .date
                                                        .toString())))
                                                        .toList();
                                                    print(adview!.length);
                                                    print(adview!.length);
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
                                                  setState((){
                                                    status = "This month";
                                                    adview = alladview!
                                                        .where((element) => now_1m
                                                        .isBefore(DateTime
                                                        .parse(element
                                                        .date
                                                        .toString())))
                                                        .toList();
                                                    print(adview!.length);
                                                    print(adview!.length);
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

                                              PopupMenuItem(
                                                onTap: () async {
                                                  setState(() {
                                                    status = "Custom";
                                                    // ads = allads!
                                                    //     .where((element) => now_1m.isBefore(
                                                    //     DateTime.parse(
                                                    //         element.startDate.toString())))
                                                    //     .toList();
                                                  });
                                                },
                                                value: 6,
                                                // row with two children
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("Custom")
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
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "${status}  ",
                                                      style:
                                                      TextStyle(fontSize: 13),
                                                    ),
                                                    Image.asset(
                                                        "image/icon/calendar.png")
                                                  ],
                                                ),
                                              ),
                                            ),
                                            elevation: 2,
                                            // on selected we show the dialog box
                                            onSelected: (value) async {
                                              if (value == 6) {
                                                DateTimeRange? result =
                                                await showDateRangePicker(
                                                  context: context,
                                                  firstDate: DateTime.now(),
                                                  // the earliest allowable
                                                  lastDate:
                                                  DateTime(2030, 12, 31),
                                                  // the latest allowable
                                                  currentDate: DateTime.now(),
                                                  saveText: 'Done',
                                                  builder: (context, child) {
                                                    return Theme(
                                                      data: Theme.of(context)
                                                          .copyWith(
                                                        colorScheme:
                                                        ColorScheme.light(
                                                          primary:
                                                          Color(0xFFFF7711),
                                                          onPrimary: Colors
                                                              .white, // <-- SEE HERE
                                                          // onSurface: Colors.blueAccent, //
                                                        ),
                                                        textButtonTheme:
                                                        TextButtonThemeData(
                                                          style: TextButton
                                                              .styleFrom(
                                                            primary: Colors
                                                                .white, // button text color
                                                          ),
                                                        ),
                                                      ),
                                                      child: child!,
                                                    );
                                                  },
                                                );

                                                setState(() {
                                                  start = result!.start;
                                                  end = result.end;
                                                  adview = alladview!.where((element) => start!.isBefore(DateTime.parse(element.date.toString()))&&end!.isAfter(DateTime.parse(element.date.toString()))).toList();
                                                });
                                              }
                                            },
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "${status == "Custom" ? "${start == null && end == null ? "Select Start/End Date" : "${start!.day}/${start!.month}/${start!.year} - ${end!.day}/${end!.month}/${end!.year}"}" : status} current click"),
                                      Text(
                                        "${adview!.length}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        secondChild: adview==null&&adclick==null?Container():SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 22.0, top: 0, left: 22),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0.0, top: 5),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [Text("Filter date")],
                                      ),
                                    ),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Builder(builder: (context) {
                                        var now = DateTime.now();
                                        var now_1ys =
                                        now.subtract(Duration(days: 1));
                                        var now_1w =
                                        now.subtract(Duration(days: 7));
                                        var now_1m = DateTime(
                                            now.year, now.month - 1, now.day);
                                        return Container(
                                          width: 100,
                                          height: 32,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFF9FAFB),
                                              border: Border.all(
                                                  color: Color(0xFFD1D5DB)),
                                              borderRadius:
                                              BorderRadius.circular(4)),
                                          margin:
                                          const EdgeInsets.only(bottom: 0.0),
                                          child: PopupMenuButton<int>(
                                            padding: EdgeInsets.zero,
                                            itemBuilder: (context) => [
                                              // PopupMenuItem 2
                                              PopupMenuItem(
                                                onTap: () {
                                                  setState(() {
                                                    status = "Today";
                                                    adclick = alladclick!
                                                        .where((element) =>
                                                    now.year ==
                                                        DateTime.parse(element
                                                            .date
                                                            .toString())
                                                            .year &&
                                                        now.day ==
                                                            DateTime.parse(element
                                                                .date
                                                                .toString())
                                                                .day &&
                                                        now.month ==
                                                            DateTime.parse(element
                                                                .date
                                                                .toString())
                                                                .month)
                                                        .toList();

                                                  });
                                                  print(adclick!.length);
                                                  print(adclick!.length);
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
                                                    status = "Yesterday";
                                                    adclick = alladclick!
                                                        .where((element) => now_1ys
                                                        .isBefore(DateTime
                                                        .parse(element
                                                        .date
                                                        .toString())))
                                                        .toList();
                                                    print(adclick!.length);
                                                    print(adclick!.length);
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
                                                    adclick = alladclick!
                                                        .where((element) => now_1w
                                                        .isBefore(DateTime
                                                        .parse(element
                                                        .date
                                                        .toString())))
                                                        .toList();
                                                    print(adclick!.length);
                                                    print(adclick!.length);
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
                                                  setState((){
                                                    status = "This month";
                                                    adclick = alladclick!
                                                        .where((element) => now_1m
                                                        .isBefore(DateTime
                                                        .parse(element
                                                        .date
                                                        .toString())))
                                                        .toList();
                                                    print(adclick!.length);
                                                    print(adclick!.length);
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

                                              PopupMenuItem(
                                                onTap: () async {
                                                  setState(() {
                                                    status = "Custom";
                                                    // ads = allads!
                                                    //     .where((element) => now_1m.isBefore(
                                                    //     DateTime.parse(
                                                    //         element.startDate.toString())))
                                                    //     .toList();
                                                  });
                                                },
                                                value: 6,
                                                // row with two children
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("Custom")
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
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "${status}  ",
                                                      style:
                                                      TextStyle(fontSize: 13),
                                                    ),
                                                    Image.asset(
                                                        "image/icon/calendar.png")
                                                  ],
                                                ),
                                              ),
                                            ),
                                            elevation: 2,
                                            // on selected we show the dialog box
                                            onSelected: (value) async {
                                              if (value == 6) {
                                                DateTimeRange? result =
                                                await showDateRangePicker(
                                                  context: context,
                                                  firstDate: DateTime.now(),
                                                  // the earliest allowable
                                                  lastDate:
                                                  DateTime(2030, 12, 31),
                                                  // the latest allowable
                                                  currentDate: DateTime.now(),
                                                  saveText: 'Done',
                                                  builder: (context, child) {
                                                    return Theme(
                                                      data: Theme.of(context)
                                                          .copyWith(
                                                        colorScheme:
                                                        ColorScheme.light(
                                                          primary:
                                                          Color(0xFFFF7711),
                                                          onPrimary: Colors
                                                              .white, // <-- SEE HERE
                                                          // onSurface: Colors.blueAccent, //
                                                        ),
                                                        textButtonTheme:
                                                        TextButtonThemeData(
                                                          style: TextButton
                                                              .styleFrom(
                                                            primary: Colors
                                                                .white, // button text color
                                                          ),
                                                        ),
                                                      ),
                                                      child: child!,
                                                    );
                                                  },
                                                );

                                                setState(() {
                                                  start = result!.start;
                                                  end = result.end;
                                                  adclick = alladclick!.where((element) => start!.isBefore(DateTime.parse(element.date.toString()))&&end!.isAfter(DateTime.parse(element.date.toString()))).toList();
                                                });
                                              }
                                            },
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "${status == "Custom" ? "${start == null && end == null ? "Select Start/End Date" : "${start!.day}/${start!.month}/${start!.year} - ${end!.day}/${end!.month}/${end!.year}"}" : status} current click"),
                                      Text(
                                        "${adclick!.length}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        crossFadeState: _first
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                      ),
                    ],
                    // controller: controller,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Text(
                    "Ad details",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 5, right: 20),
                  child: Text(
                    "Every information about this Ad",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),

                widget.ads!.landType=="shop"?
                Container():
                InkWell(
                  onTap: (){
                    var authProvider = Provider.of<AuthProvider>(context, listen: false);
                    // authProvider.getCategory();


                    // showBottomSheetSelector(context,
                    //     "store type",
                    //     onChanged:(index, items){
                    //
                    //       setState((){
                    //         selectedStoreType =  storeType[index];
                    //         //    authProvider.set(items[index]);
                    //         Navigator.pop(context);
                    //       });
                    //     },
                    //     items: storeType);

                  },
                  child: Container(
                    padding:
                    const EdgeInsets
                        .only(
                        left: 20, right: 20),
                    height: 45,
                    child:
                    TextFormField(
                      initialValue: "${widget.ads!.url}",
                      enabled: false,
                      validator:
                          (value) {
                        if (value ==
                            null ||
                            value
                                .isEmpty) {
                          return 'website link is Required';
                        }
                        return null;
                      },
                      // controller: fullname,
                      decoration:
                      InputDecoration(
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
                        hintText: "https://",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
                  child: Text(
                    'State',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: InkWell(
                    onTap: () {
                      // var authProvider =
                      //     Provider.of<AuthProvider>(context, listen: false);
                      // // authProvider.getCategory();
                      // // authProvider.getMarkets();
                      //
                      // showBottomSheetSelector(context, "state",
                      //     onChanged: (index, items) {
                      //   authProvider.setState(items[index]);
                      //   authProvider.getMarkets();
                      //   Navigator.pop(context);
                      // }, items: authProvider.states);
                    },
                    child: Container(
                      height: 45,
                      child: TextFormField(
                        enabled: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Market is Required';
                          }
                          return null;
                        },
                        // controller: fullname,
                        decoration: InputDecoration(
                          // suffixIcon: Icon(
                          //   Icons.keyboard_arrow_down_rounded,
                          //   size: 30,
                          // ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26, width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26, width: 1),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26, width: 1),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black45,
                            fontSize: 13,
                          ),
                          hintText:
                          "     ${widget.ads!.state![0]["title"]}",
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                  child: Text(
                    'Market',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          // var authProvider =
                          //     Provider.of<AuthProvider>(context, listen: false);
                          // // authProvider.getCategory();
                          //
                          // showBottomSheetSelector(context, "market",
                          //     onChanged: (index, items) {
                          //   authProvider.setMarket(items[index]);
                          //   print(items[index].id);
                          //   authProvider.getMarketCategory(marketid: items[index].id);
                          //   Navigator.pop(context);
                          // }, items: authProvider.market);
                        },
                        child: Container(
                          height: 45,
                          child: TextFormField(
                            enabled: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Market is Required';
                              }
                              return null;
                            },
                            // controller: fullname,
                            decoration: InputDecoration(
                              // suffixIcon: Icon(
                              //   Icons.keyboard_arrow_down_rounded,
                              //   size: 30,
                              // ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26, width: 1),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26, width: 1),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.black45,
                                fontSize: 13,
                              ),
                              hintText:
                              "",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: Wrap(
                          children: widget.ads!.market!.map((e) => Container(
                              width: 140,
                              height: 22,
                              decoration: BoxDecoration(color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text(
                                    "${e["title"]}", style: TextStyle(
                                      overflow: TextOverflow.ellipsis
                                  ),  overflow: TextOverflow.ellipsis, softWrap: true, maxLines: 1,)]))).toList(),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
                  child: Text(
                    'Product category',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Stack(
                    children: [
                      InkWell(
                        onTap:() {
                          // var authProvider =
                          //     Provider.of<AuthProvider>(context, listen: false);
                          //
                          // showBottomSheetSelector(context, "category",
                          //     onChanged: (index, items) async {
                          //   Navigator.pop(context);
                          //   setState(() {
                          //     category = items[index];
                          //   });
                          // }, items: authProvider.marketspecificSubCategory);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 15),
                          height: 45,
                          child: TextFormField(
                            enabled: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Market is Required';
                              }
                              return null;
                            },
                            // controller: fullname,
                            decoration: InputDecoration(
                              // suffixIcon: Icon(
                              //   Icons.keyboard_arrow_down_rounded,
                              //   size: 30,
                              // ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26, width: 1),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26, width: 1),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.black45,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: Wrap(
                          children: [
                            Container(
                                width: 80,
                                height: 22,
                                decoration: BoxDecoration(color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Text(
                                      "${widget.ads!.category["title"].toString()}", style: TextStyle(
                                        overflow: TextOverflow.ellipsis
                                    ),  overflow: TextOverflow.ellipsis, softWrap: true, maxLines: 1,)]))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                
                // Text(widget.ads!.id.toString()),
                
                widget.ads!.status=="approved"?Container():Padding(
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
                                backgroundColor: MaterialStateProperty.all(Color(0xFFFF7711)),
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
                                'Approve Ad',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onPressed:widget.ads!.status.toString().toLowerCase()=="approved"?(){}:
                                (){

                     AdvertService advertService =
                     Provider.of<AdvertService>(context, listen: false);

                              circularCustom(context);
                              advertService.updateAdvert(
                                  widget.ads!.id,
                                  "approved",
                                  context
                              ).then((value){
                                Navigator.pop(context);
                                if(value){
                                  setState(() {
                                    widget.ads!.status=="approved";
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

  List<String> days = ["Daily", "Weekly", "Monthly", "Custom"];
  String type = "Daily";

  Widget AdTab(context) {
    // List<AdViewModel> newadviw =  adview!.where((element) => element.status=="views").toList();
    String type = "Link";
    Services? category;
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    AdvertService advertService =
    Provider.of<AdvertService>(context, listen: false);
    // var marketProvider = Provider.of<MarketProvider>(context, listen: true);

    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.only(left: 25, right: 25),

            // width: MediaQuery.of(context).size.width * 0.9,
            //This is responsible for the background of the tabbar, does the magic
            decoration: BoxDecoration(
                //This is for background color
                color: Colors.transparent,
                //This is for bottom border that is needed
                border: Border(
                    bottom: BorderSide(color: Colors.black26, width: 0.2))),
            child: Center(
              child: Stack(
                children: [
                  Positioned(
                    top: 49,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 0.8,
                      decoration: BoxDecoration(color: Colors.black12),
                    ),
                  ),
                  TabBar(
                      onTap: (value) {
                        if (value == 0) {
                          setState(() {
                            controller!.animateTo(0);
                            _first = true;
                          });
                        } else {
                          setState(() {
                            controller!.animateTo(1);
                            _first = false;
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Views"),
                          ],
                        )),
                        Tab(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Clicks"),
                          ],
                        )),
                      ]),
                ],
              ),
            ),
          ),
        ),
        adview==null&&adclick==null?Container():
        Column(
    mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:  CrossAxisAlignment.start,
          children: [
            Container(
              color: Color(0xFFf3f4f6),
              // height: MediaQuery.of(context).size.height*0.45,
              width: MediaQuery.of(context).size.width,
              child: "marketProvider.products" == null ||
                  "marketProvider.stores" == null
                  ? ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
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
                                              style: TextStyle(fontSize: 18),
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
                                      Icons.keyboard_arrow_up_outlined,
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
                                            BorderRadius.circular(50),
                                            color: Color(0xFFECFDF3)),
                                        child: Center(
                                            child: Text(
                                              "e.storeType.toString()",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF02A486)),
                                            ))),
                                    Spacer(),
                                    Container(
                                        width: 100,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(5),
                                          color: clrOrange,
                                        ),
                                        child: Center(
                                            child: Text(
                                              "View shop",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ))),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
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
                                              style: TextStyle(fontSize: 18),
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
                                      Icons.keyboard_arrow_up_outlined,
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
                                            BorderRadius.circular(50),
                                            color: Color(0xFFECFDF3)),
                                        child: Center(
                                            child: Text(
                                              "e.storeType.toString()",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF02A486)),
                                            ))),
                                    Spacer(),
                                    Container(
                                        width: 100,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(5),
                                          color: clrOrange,
                                        ),
                                        child: Center(
                                            child: Text(
                                              "View shop",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ))),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
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
                                              style: TextStyle(fontSize: 18),
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
                                      Icons.keyboard_arrow_up_outlined,
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
                                            BorderRadius.circular(50),
                                            color: Color(0xFFECFDF3)),
                                        child: Center(
                                            child: Text(
                                              "e.storeType.toString()",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF02A486)),
                                            ))),
                                    Spacer(),
                                    Container(
                                        width: 100,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(5),
                                          color: clrOrange,
                                        ),
                                        child: Center(
                                            child: Text(
                                              "View shop",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ))),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
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
              )
                  : adview==null&&adclick==null?Container():
              ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 800),
                    firstChild: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 22.0, top: 0, left: 22),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0.0, top: 5),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [Text("Filter date")],
                                  ),
                                ),
                                Spacer(),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Builder(builder: (context) {
                                    var now = DateTime.now();
                                    var now_1ys =
                                    now.subtract(Duration(days: 1));
                                    var now_1w =
                                    now.subtract(Duration(days: 7));
                                    var now_1m = DateTime(
                                        now.year, now.month - 1, now.day);
                                    return Container(
                                      width: 100,
                                      height: 32,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF9FAFB),
                                          border: Border.all(
                                              color: Color(0xFFD1D5DB)),
                                          borderRadius:
                                          BorderRadius.circular(4)),
                                      margin:
                                      const EdgeInsets.only(bottom: 0.0),
                                      child: PopupMenuButton<int>(
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (context) => [
                                          // PopupMenuItem 2
                                          PopupMenuItem(
                                            onTap: () {
                                              setState(() {
                                                status = "Today";
                                                adview = alladview!
                                                    .where((element) =>
                                                now.year ==
                                                    DateTime.parse(element
                                                        .date
                                                        .toString())
                                                        .year &&
                                                    now.day ==
                                                        DateTime.parse(element
                                                            .date
                                                            .toString())
                                                            .day &&
                                                    now.month ==
                                                        DateTime.parse(element
                                                            .date
                                                            .toString())
                                                            .month)
                                                    .toList();

                                              });
                                              print(adview!.length);
                                              print(adview!.length);
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
                                                status = "Yesterday";
                                                adview = alladview!
                                                    .where((element) => now_1ys
                                                    .isBefore(DateTime
                                                    .parse(element
                                                    .date
                                                    .toString())))
                                                    .toList();
                                                print(adview!.length);
                                                print(adview!.length);
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
                                                adview = alladview!
                                                    .where((element) => now_1w
                                                    .isBefore(DateTime
                                                    .parse(element
                                                    .date
                                                    .toString())))
                                                    .toList();
                                                print(adview!.length);
                                                print(adview!.length);
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
                                              setState((){
                                                status = "This month";
                                                adview = alladview!
                                                    .where((element) => now_1m
                                                    .isBefore(DateTime
                                                    .parse(element
                                                    .date
                                                    .toString())))
                                                    .toList();
                                                print(adview!.length);
                                                print(adview!.length);
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

                                          PopupMenuItem(
                                            onTap: () async {
                                              setState(() {
                                                status = "Custom";
                                                // ads = allads!
                                                //     .where((element) => now_1m.isBefore(
                                                //     DateTime.parse(
                                                //         element.startDate.toString())))
                                                //     .toList();
                                              });
                                            },
                                            value: 6,
                                            // row with two children
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("Custom")
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
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${status}  ",
                                                  style:
                                                  TextStyle(fontSize: 13),
                                                ),
                                                Image.asset(
                                                    "image/icon/calendar.png")
                                              ],
                                            ),
                                          ),
                                        ),
                                        elevation: 2,
                                        // on selected we show the dialog box
                                        onSelected: (value) async {
                                          if (value == 6) {
                                            DateTimeRange? result =
                                            await showDateRangePicker(
                                              context: context,
                                              firstDate: DateTime.now(),
                                              // the earliest allowable
                                              lastDate:
                                              DateTime(2030, 12, 31),
                                              // the latest allowable
                                              currentDate: DateTime.now(),
                                              saveText: 'Done',
                                              builder: (context, child) {
                                                return Theme(
                                                  data: Theme.of(context)
                                                      .copyWith(
                                                    colorScheme:
                                                    ColorScheme.light(
                                                      primary:
                                                      Color(0xFFFF7711),
                                                      onPrimary: Colors
                                                          .white, // <-- SEE HERE
                                                      // onSurface: Colors.blueAccent, //
                                                    ),
                                                    textButtonTheme:
                                                    TextButtonThemeData(
                                                      style: TextButton
                                                          .styleFrom(
                                                        primary: Colors
                                                            .white, // button text color
                                                      ),
                                                    ),
                                                  ),
                                                  child: child!,
                                                );
                                              },
                                            );

                                            setState(() {
                                              start = result!.start;
                                              end = result.end;
                                              adview = alladview!.where((element) => start!.isBefore(DateTime.parse(element.date.toString()))&&end!.isAfter(DateTime.parse(element.date.toString()))).toList();
                                            });
                                          }
                                        },
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 20.0, right: 20),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "${status == "Custom" ? "${start == null && end == null ? "Select Start/End Date" : "${start!.day}/${start!.month}/${start!.year} - ${end!.day}/${end!.month}/${end!.year}"}" : status} current click"),
                                  Text(
                                    "${adview!.length}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    secondChild: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 22.0, top: 0, left: 22),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0.0, top: 5),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [Text("Filter date")],
                                  ),
                                ),
                                Spacer(),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Builder(builder: (context) {
                                    var now = DateTime.now();
                                    var now_1ys =
                                    now.subtract(Duration(days: 1));
                                    var now_1w =
                                    now.subtract(Duration(days: 7));
                                    var now_1m = DateTime(
                                        now.year, now.month - 1, now.day);
                                    return Container(
                                      width: 100,
                                      height: 32,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF9FAFB),
                                          border: Border.all(
                                              color: Color(0xFFD1D5DB)),
                                          borderRadius:
                                          BorderRadius.circular(4)),
                                      margin:
                                      const EdgeInsets.only(bottom: 0.0),
                                      child: PopupMenuButton<int>(
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (context) => [
                                          // PopupMenuItem 2
                                          PopupMenuItem(
                                            onTap: () {
                                              setState(() {
                                                status = "Today";
                                                adclick = alladclick!
                                                    .where((element) =>
                                                now.year ==
                                                    DateTime.parse(element
                                                        .date
                                                        .toString())
                                                        .year &&
                                                    now.day ==
                                                        DateTime.parse(element
                                                            .date
                                                            .toString())
                                                            .day &&
                                                    now.month ==
                                                        DateTime.parse(element
                                                            .date
                                                            .toString())
                                                            .month)
                                                    .toList();

                                              });
                                              print(adclick!.length);
                                              print(adclick!.length);
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
                                                status = "Yesterday";
                                                adclick = alladclick!
                                                    .where((element) => now_1ys
                                                    .isBefore(DateTime
                                                    .parse(element
                                                    .date
                                                    .toString())))
                                                    .toList();
                                                print(adclick!.length);
                                                print(adclick!.length);
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
                                                adclick = alladclick!
                                                    .where((element) => now_1w
                                                    .isBefore(DateTime
                                                    .parse(element
                                                    .date
                                                    .toString())))
                                                    .toList();
                                                print(adclick!.length);
                                                print(adclick!.length);
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
                                              setState((){
                                                status = "This month";
                                                adclick = alladclick!
                                                    .where((element) => now_1m
                                                    .isBefore(DateTime
                                                    .parse(element
                                                    .date
                                                    .toString())))
                                                    .toList();
                                                print(adclick!.length);
                                                print(adclick!.length);
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

                                          PopupMenuItem(
                                            onTap: () async {
                                              setState(() {
                                                status = "Custom";
                                                // ads = allads!
                                                //     .where((element) => now_1m.isBefore(
                                                //     DateTime.parse(
                                                //         element.startDate.toString())))
                                                //     .toList();
                                              });
                                            },
                                            value: 6,
                                            // row with two children
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("Custom")
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
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${status}  ",
                                                  style:
                                                  TextStyle(fontSize: 13),
                                                ),
                                                Image.asset(
                                                    "image/icon/calendar.png")
                                              ],
                                            ),
                                          ),
                                        ),
                                        elevation: 2,
                                        // on selected we show the dialog box
                                        onSelected: (value) async {
                                          if (value == 6) {
                                            DateTimeRange? result =
                                            await showDateRangePicker(
                                              context: context,
                                              firstDate: DateTime.now(),
                                              // the earliest allowable
                                              lastDate:
                                              DateTime(2030, 12, 31),
                                              // the latest allowable
                                              currentDate: DateTime.now(),
                                              saveText: 'Done',
                                              builder: (context, child) {
                                                return Theme(
                                                  data: Theme.of(context)
                                                      .copyWith(
                                                    colorScheme:
                                                    ColorScheme.light(
                                                      primary:
                                                      Color(0xFFFF7711),
                                                      onPrimary: Colors
                                                          .white, // <-- SEE HERE
                                                      // onSurface: Colors.blueAccent, //
                                                    ),
                                                    textButtonTheme:
                                                    TextButtonThemeData(
                                                      style: TextButton
                                                          .styleFrom(
                                                        primary: Colors
                                                            .white, // button text color
                                                      ),
                                                    ),
                                                  ),
                                                  child: child!,
                                                );
                                              },
                                            );

                                            setState(() {
                                              start = result!.start;
                                              end = result.end;
                                              adclick = alladclick!.where((element) => start!.isBefore(DateTime.parse(element.date.toString()))&&end!.isAfter(DateTime.parse(element.date.toString()))).toList();
                                            });
                                          }
                                        },
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 20.0, right: 20),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "${status == "Custom" ? "${start == null && end == null ? "Select Start/End Date" : "${start!.day}/${start!.month}/${start!.year} - ${end!.day}/${end!.month}/${end!.year}"}" : status} current click"),
                                  Text(
                                    "${adclick!.length}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    crossFadeState: _first
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                ],
                // controller: controller,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              height: 5,
              decoration: BoxDecoration(
                color: Colors.black12,
              ),
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Text(
                "Ad details",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 5, right: 20),
              child: Text(
                "Every information about this Ad",
                style: TextStyle(fontSize: 13, color: Colors.black),
              ),
            ),
            widget.ads!.landType=="shop"?
            Container():
            InkWell(
              onTap: (){
                var authProvider = Provider.of<AuthProvider>(context, listen: false);
                // authProvider.getCategory();


                // showBottomSheetSelector(context,
                //     "store type",
                //     onChanged:(index, items){
                //
                //       setState((){
                //         selectedStoreType =  storeType[index];
                //         //    authProvider.set(items[index]);
                //         Navigator.pop(context);
                //       });
                //     },
                //     items: storeType);

              },
              child: Container(
                padding:
                const EdgeInsets
                    .only(
                    left: 20, right: 20),
                height: 45,
                child:
                TextFormField(
                  initialValue: "${widget.ads!.url}",
                  enabled: false,
                  validator:
                      (value) {
                    if (value ==
                        null ||
                        value
                            .isEmpty) {
                      return 'website link is Required';
                    }
                    return null;
                  },
                  // controller: fullname,
                  decoration:
                  InputDecoration(
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
                    hintText: "https://",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
              child: Text(
                'State',
                style: TextStyle(color: Colors.black45),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: InkWell(
                onTap: () {
                  // var authProvider =
                  //     Provider.of<AuthProvider>(context, listen: false);
                  // // authProvider.getCategory();
                  // // authProvider.getMarkets();
                  //
                  // showBottomSheetSelector(context, "state",
                  //     onChanged: (index, items) {
                  //   authProvider.setState(items[index]);
                  //   authProvider.getMarkets();
                  //   Navigator.pop(context);
                  // }, items: authProvider.states);
                },
                child: Container(
                  height: 45,
                  child: TextFormField(
                    enabled: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Market is Required';
                      }
                      return null;
                    },
                    // controller: fullname,
                    decoration: InputDecoration(
                      // suffixIcon: Icon(
                      //   Icons.keyboard_arrow_down_rounded,
                      //   size: 30,
                      // ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26, width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26, width: 1),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26, width: 1),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black45,
                        fontSize: 13,
                      ),
                      hintText:
                      "     ${widget.ads!.state![0]["title"]}",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: Text(
                'Market',
                style: TextStyle(color: Colors.black45),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      // var authProvider =
                      //     Provider.of<AuthProvider>(context, listen: false);
                      // // authProvider.getCategory();
                      //
                      // showBottomSheetSelector(context, "market",
                      //     onChanged: (index, items) {
                      //   authProvider.setMarket(items[index]);
                      //   print(items[index].id);
                      //   authProvider.getMarketCategory(marketid: items[index].id);
                      //   Navigator.pop(context);
                      // }, items: authProvider.market);
                    },
                    child: Container(
                      height: 45,
                      child: TextFormField(
                        enabled: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Market is Required';
                          }
                          return null;
                        },
                        // controller: fullname,
                        decoration: InputDecoration(
                          // suffixIcon: Icon(
                          //   Icons.keyboard_arrow_down_rounded,
                          //   size: 30,
                          // ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26, width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26, width: 1),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26, width: 1),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black45,
                            fontSize: 13,
                          ),
                          hintText:
                          "",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: Wrap(
                      children: widget.ads!.market!.map((e) => Container(
                          width: 140,
                          height: 22,
                          decoration: BoxDecoration(color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text(
                                "${e["title"]}", style: TextStyle(
                                  overflow: TextOverflow.ellipsis
                              ),  overflow: TextOverflow.ellipsis, softWrap: true, maxLines: 1,)]))).toList(),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
              child: Text(
                'Product category',
                style: TextStyle(color: Colors.black45),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Stack(
                children: [
                  InkWell(
                    onTap:() {
                      // var authProvider =
                      //     Provider.of<AuthProvider>(context, listen: false);
                      //
                      // showBottomSheetSelector(context, "category",
                      //     onChanged: (index, items) async {
                      //   Navigator.pop(context);
                      //   setState(() {
                      //     category = items[index];
                      //   });
                      // }, items: authProvider.marketspecificSubCategory);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15),
                      height: 45,
                      child: TextFormField(
                        enabled: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Market is Required';
                          }
                          return null;
                        },
                        // controller: fullname,
                        decoration: InputDecoration(
                          // suffixIcon: Icon(
                          //   Icons.keyboard_arrow_down_rounded,
                          //   size: 30,
                          // ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26, width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26, width: 1),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26, width: 1),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black45,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: Wrap(
                      children: [
                        Container(
                            width: 80,
                            height: 22,
                            decoration: BoxDecoration(color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text(
                                  "${widget.ads!.category["title"].toString()}", style: TextStyle(
                                    overflow: TextOverflow.ellipsis
                                ),  overflow: TextOverflow.ellipsis, softWrap: true, maxLines: 1,)]))
                      ],
                    ),
                  )
                ],
              ),
            ),
            widget.ads!.status=="approved"?Container():Padding(
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
                            backgroundColor: MaterialStateProperty.all(Color(0xFFFF7711)),
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
                            'Approve Ad',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        onPressed:widget.ads!.status.toString().toLowerCase()=="approved"?(){}:
                            (){
                          circularCustom(context);
                          advertService.updateAdvert(
                              widget.ads!.id,
                              "approved",
                            context
                          ).then((value){
                            Navigator.pop(context);
                            if(value){
                              setState(() {
                                widget.ads!.status=="approved";
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
      ],
    );
  }

  formatDate(DateTime now) {
    final DateFormat formatter = DateFormat('EEEE, dd MMMM yyyy');
    final String formatted = formatter.format(now);
    return formatted;
  }

  formatDate2(
    DateTime now,
    now2,
  ) {
    final DateFormat formatter1 = DateFormat('MMM. dd');
    final String formatted1 = formatter1.format(now);

    final DateFormat formatter2 = DateFormat('MMM. dd yyyy');
    final String formatted2 = formatter2.format(now);
    return "${formatted1} - ${formatted2}";
  }
}
