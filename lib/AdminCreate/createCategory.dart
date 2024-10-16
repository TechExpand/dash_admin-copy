// import 'package:coin_mika/Screen/Home/CoinDetail.dart';

import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';



import 'package:provider/provider.dart';
import '../../../Model/service.dart';
import '../../../Widget/sheet.dart';
import '../../../constant/color.dart';
import '../Provider/AuthProvider.dart';




class CreateCategory extends StatefulWidget {
  const CreateCategory({Key? key}) : super(key: key);

  @override
  State<CreateCategory> createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> with TickerProviderStateMixin {
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
                                                "SubCategory",
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
                                                  "Assign Sub-Category to Catgory",
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
                                                            25.0),
                                                        child: Text(
                                                          'Market name',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black45),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 45,
                                                        child:
                                                        TextFormField(
                                                          validator:
                                                              (value) {
                                                            if (value ==
                                                                null ||
                                                                value
                                                                    .isEmpty) {
                                                              return 'Store is Required';
                                                            }
                                                            return null;
                                                          },
                                                          onChanged: (value){
                                                            storeName = value;
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
                                                                fontSize: 13
                                                            ),
                                                            hintText: "    Enter Catgory name",
                                                          ),
                                                        ),
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
                                                          'Create Category',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white),
                                                        ),
                                                      ),
                                                      onPressed:
                                                      storeName.isEmpty

                                                          ?() async {
                                                        await showTextToast(
                                                          text: "field cannot be empty",
                                                          context: context,
                                                        );
                                                      }:
                                                          (){
                                                        authProvider.setLoad();
                                                        authProvider.createCategory(
                                                            title: storeName,
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
