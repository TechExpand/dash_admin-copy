// import 'package:coin_mika/Screen/Home/CoinDetail.dart';

import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';



import 'package:provider/provider.dart';
import '../../../Model/service.dart';
import '../../../Widget/sheet.dart';
import '../../../constant/color.dart';
import '../Provider/AuthProvider.dart';




class AssignMarket extends StatefulWidget {
  const AssignMarket({Key? key}) : super(key: key);

  @override
  State<AssignMarket> createState() => _AssignMarketState();
}

class _AssignMarketState extends State<AssignMarket> with TickerProviderStateMixin {
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
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 5,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

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
                                          IconButton(
                                            padding: EdgeInsets.all(5),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(MdiIcons.close,
                                                color: Colors.black),
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
                                                  "Assign Category to Market",
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
                                                      InkWell(
                                                        onTap: authProvider.selectedState==null?() async {
                                                          await showTextToast(
                                                            text: "Select state",
                                                            context: context,
                                                          );
                                                        } :
                                                            (){
                                                          var authProvider = Provider.of<AuthProvider>(context, listen: false);
                                                          // authProvider.getCategory();


                                                          showBottomSheetSelector(
                                                              context,
                                                              "market",
                                                              onChanged: (index, items){
                                                                authProvider.setMarket(items[index]);
                                                                print(items[index].id);
                                                                authProvider.getMarketCategory(marketid:items[index].id );
                                                                Navigator.pop(context);
                                                              },
                                                              items: authProvider.market);

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
                                                              hintText: "    ${authProvider.selectedMarket==null?"Select market":"${authProvider.selectedMarket!.title}"}",
                                                            ),
                                                          ),
                                                        ),
                                                      ),




                                                      Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(
                                                            top:
                                                            15.0),
                                                        child: Text(
                                                          'Product category',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black45),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: authProvider.allsubcategory==null?() async {
                                                          await showTextToast(
                                                            text: "Select market",
                                                            context: context,
                                                          );
                                                        } : (){
                                                          var authProvider = Provider.of<AuthProvider>(context, listen: false);

                                                          showBottomSheetSelector(context,
                                                              "category",
                                                              onChanged:(index, items) async {
                                                                authProvider.setCategorySingle(items[index]);
                                                                Navigator.pop(context);
                                                              },
                                                              items: authProvider.allsubcategory);

                                                        },
                                                        child: Container(
                                                          margin: EdgeInsets.only(bottom:15),
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
                                                              hintText: "    Select category",
                                                            ),
                                                          ),
                                                        ),
                                                      ),


                                                      Container(
                                                        width: MediaQuery.of(context).size.width,
                                                        child: authProvider.selectedCategory==null?Container():Wrap(
                                                            children: authProvider.selectedCategory
                                                            !.map((e) => Padding(
                                                              padding: const EdgeInsets.only(left: 5, right: 5,bottom: 8),
                                                              child: Container(
                                                                height: 30,
                                                                width: 160,
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment.center,
                                                                  children: [
                                                                    Text(e.title.toString(),
                                                                      softWrap: true,
                                                                      overflow: TextOverflow.ellipsis,
                                                                      style: TextStyle(color: Colors.black, fontSize: 11),),
                                                                    SizedBox(width: 10,),
                                                                    InkWell(
                                                                        onTap: (){
                                                                          setState((){
                                                                            e.selected = !e.selected;
                                                                            authProvider.selectedCategory!.remove(e);

                                                                          });
                                                                        },
                                                                        child: Container(
                                                                          height: 16,
                                                                          width: 16,
                                                                          decoration: BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                              color: Colors.black26
                                                                          ),
                                                                          child: Icon(MdiIcons.close, size: 13,
                                                                            color: Colors.white,),
                                                                        ))

                                                                  ],
                                                                ),
                                                                decoration: BoxDecoration(
                                                                    color: Color(0xFFEEEEF0),
                                                                    borderRadius: BorderRadius.circular(15)),
                                                              ),
                                                            ))
                                                                .toList()),
                                                      ),



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
                                                        top: 25.0,bottom: 60),
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                          elevation:
                                                          MaterialStateProperty
                                                              .all(0),
                                                          backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Color(
                                                              0xFFFF7711)),
                                                          shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    10.0),
                                                              ))),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                            context)
                                                            .size
                                                            .width *
                                                            0.75,
                                                        height: 50,
                                                        alignment: Alignment
                                                            .center,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                10)),
                                                        child:


                                                        authProvider.loading? SizedBox(
                                                          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                                                          height: 30.0,
                                                          width: 30.0,
                                                        ):
                                                        Text(
                                                          'Assign Market',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white),
                                                        ),
                                                      ),
                                                      onPressed: authProvider.selectedState==null||
                                                          authProvider.selectedMarket==null||authProvider.selectedCategory==null||
                                                          authProvider.selectedCategory!.isEmpty

                                                          ?() async {
                                                        await showTextToast(
                                                          text: "field cannot be empty",
                                                          context: context,
                                                        );
                                                      }:
                                                          (){
                                                        authProvider.setLoad();
                                                        authProvider.assignMarket(
                                                            marketID: authProvider.selectedMarket!.id,
                                                            subcarID: authProvider.selectedCategory![0].id,
                                                            context: context
                                                        );

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
