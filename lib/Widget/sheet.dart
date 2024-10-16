import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:martline_admin/dashboard.dart';

import 'package:provider/provider.dart';

import '../Model/service.dart';
import '../Provider/AuthProvider.dart';

sendDialog(context){
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible:false,
      isScrollControlled: true,
      builder: (builder){
        return WillPopScope(
          onWillPop: ()async{
            return false;
          },
          child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
            child: AnimatedPadding(
              padding: MediaQuery.of(context).viewInsets,
              duration: const Duration(milliseconds: 100),
              curve: Curves.decelerate,
              child: new StatefulBuilder(
                  builder: (context, setState) {
                    return new Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                          child: Container(
                            color: Colors.transparent,
                            height: 486,
                            child: Stack(
                              children: [

                                Align(
                                  alignment:Alignment.center ,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                        color: Colors.white
                                    ),
                                    height: 486.0,
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 200,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            image: new DecorationImage(
                                              fit: BoxFit.cover,
                                              image: new AssetImage(
                                                'image/store1.png',
                                              ),
                                            ),
                                          ),
                                        ),
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
                                                padding: const EdgeInsets.only(top:25.0,),
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width*0.8,
                                                  child: Text('Merchant account created',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 18,
                                                        color: Colors.black, fontWeight: FontWeight.bold),),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(top:15.0, left: 10),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width*0.8,
                                            child: Text('Your merchant account has been created successfull, to start selling create a martline store.',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black54),textAlign: TextAlign.center,),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:10.0, left: 20, right:20),
                                          child: ElevatedButton(
                                            style:  ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Color(0xFFFF7711)),
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10.0),
                                                    )
                                                )
                                            ),

                                            child: Container(
                                              width: 250,
                                              height: 50,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
                                              child: Text('Create Store'),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  pageBuilder: (context, animation, secondaryAnimation) {
                                                    return Dashboard();
                                                  },
                                                  transitionsBuilder:
                                                      (context, animation, secondaryAnimation, child) {
                                                    return FadeTransition(
                                                      opacity: animation,
                                                      child: child,
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));}),
            ),
          ),
        );
      }
  );
}


sendDialogUser(context){
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible:false,
      isScrollControlled: true,
      builder: (builder){
        return WillPopScope(
          onWillPop: ()async{
            return false;
          },
          child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
            child: AnimatedPadding(
              padding: MediaQuery.of(context).viewInsets,
              duration: const Duration(milliseconds: 100),
              curve: Curves.decelerate,
              child: new StatefulBuilder(
                  builder: (context, setState) {
                    return new Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                          child: Container(
                            color: Colors.transparent,
                            height: 486,
                            child: Stack(
                              children: [

                                Align(
                                  alignment:Alignment.center ,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                        color: Colors.white
                                    ),
                                    height: 486.0,
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 200,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            image: new DecorationImage(
                                              fit: BoxFit.cover,
                                              image: new AssetImage(
                                                'image/locate.png',
                                              ),
                                            ),
                                          ),
                                        ),
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
                                                padding: const EdgeInsets.only(top:25.0,),
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width*0.8,
                                                  child: Text('Market assigned successfully',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 18,
                                                        color: Colors.black, fontWeight: FontWeight.bold),),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        // Padding(
                                        //   padding: const EdgeInsets.only(top:15.0, left: 10),
                                        //   child: Container(
                                        //     width: MediaQuery.of(context).size.width*0.8,
                                        //     child: Text('Your account has been created, turn on your location to see markets near you.',
                                        //       style: TextStyle(
                                        //           fontSize: 16,
                                        //           color: Colors.black54),textAlign: TextAlign.center,),
                                        //   ),
                                        // ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:10.0, left: 20, right:20),
                                          child: ElevatedButton(
                                            style:  ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Color(0xFFFF7711)),
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10.0),
                                                    )
                                                )
                                            ),

                                            child: Container(
                                              width: 150,
                                              height: 50,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
                                              child: Text('Return'),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  pageBuilder: (context, animation, secondaryAnimation) {
                                                    return  Dashboard();
                                                  },
                                                  transitionsBuilder:
                                                      (context, animation, secondaryAnimation, child) {
                                                    return FadeTransition(
                                                      opacity: animation,
                                                      child: child,
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),

                                      ],
                                    ),

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));}),
            ),
          ),
        );
      }
  );
}


sendDialog2(context){
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible:false,
      isScrollControlled: true,
      builder: (builder){
        return WillPopScope(
          onWillPop: ()async{
            return false;
          },
          child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
            child: AnimatedPadding(
              padding: MediaQuery.of(context).viewInsets,
              duration: const Duration(milliseconds: 100),
              curve: Curves.decelerate,
              child: new StatefulBuilder(
                  builder: (context, setState) {
                    return new Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                          child: Container(
                            color: Colors.transparent,
                            height: 486,
                            child: Stack(
                              children: [

                                Align(
                                  alignment:Alignment.center ,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                        color: Colors.white
                                    ),
                                    height: 486.0,
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 200,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            image: new DecorationImage(
                                              fit: BoxFit.cover,
                                              image: new AssetImage(
                                                'image/store1.png',
                                              ),
                                            ),
                                          ),
                                        ),
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
                                                padding: const EdgeInsets.only(top:25.0,),
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width*0.8,
                                                  child: Text('Congratulations',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 18,
                                                        color: Colors.black, fontWeight: FontWeight.bold),),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(top:15.0, left: 10),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width*0.8,
                                            child: Text('Your store is now on martline, start selling, easy and affordable.',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black54),textAlign: TextAlign.center,),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:10.0, left: 20, right:20),
                                          child: ElevatedButton(
                                            style:  ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Color(0xFFFF7711)),
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10.0),
                                                    )
                                                )
                                            ),

                                            child: Container(
                                              width: 250,
                                              height: 50,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
                                              child: Text('Continue'),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  pageBuilder: (context, animation, secondaryAnimation) {
                                                    return Dashboard();
                                                  },
                                                  transitionsBuilder:
                                                      (context, animation, secondaryAnimation, child) {
                                                    return FadeTransition(
                                                      opacity: animation,
                                                      child: child,
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));}),
            ),
          ),
        );
      }
  );
}






// sendDialog3(context){
//  return showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       isDismissible:false,
//       isScrollControlled: true,
//       builder: (builder){
//         return WillPopScope(
//           onWillPop: ()async{
//             return false;
//           },
//           child: ClipRRect(
//             borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
//             child: AnimatedPadding(
//               padding: MediaQuery.of(context).viewInsets,
//               duration: const Duration(milliseconds: 100),
//               curve: Curves.decelerate,
//               child: new StatefulBuilder(
//                   builder: (context, setState) {
//                     return new Padding(
//                         padding: MediaQuery.of(context).viewInsets,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
//                           child: Container(
//                             color: Colors.transparent,
//                             height: 486,
//                             child: Stack(
//                               children: [
//
//                                 Align(
//                                   alignment:Alignment.center ,
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
//                                         color: Colors.white
//                                     ),
//                                     height: 486.0,
//                                     width: MediaQuery.of(context).size.width,
//                                     padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                           height: 200,
//                                           width: 150,
//                                           decoration: BoxDecoration(
//                                             image: new DecorationImage(
//                                               fit: BoxFit.cover,
//                                               image: new AssetImage(
//                                                 'image/congrat.png',
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Container(
//                                           width: MediaQuery.of(context).size.width,
//                                           child: Row(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                             children: [
//                                               // SizedBox(
//                                               //   width: MediaQuery.of(context).size.width*0.3,
//                                               // ),
//
//
//                                               Padding(
//                                                 padding: const EdgeInsets.only(top:25.0,),
//                                                 child: Container(
//                                                   width: MediaQuery.of(context).size.width*0.8,
//                                                   child: Text('Invoice requested successfully',
//                                                     textAlign: TextAlign.center,
//                                                     style: TextStyle(fontSize: 18,
//                                                         color: Colors.black, fontWeight: FontWeight.bold),),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//
//                                         Padding(
//                                           padding: const EdgeInsets.only(top:15.0, left: 10),
//                                           child: Container(
//                                             width: MediaQuery.of(context).size.width*0.8,
//                                             child: Text('Your invoice request has been sent successfully, the vendor will respond with an invoice to your request.',
//                                               style: TextStyle(
//                                                   fontSize: 16,
//                                                   color: Colors.black54),textAlign: TextAlign.center,),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(top:10.0, left: 20, right:20),
//                                           child: ElevatedButton(
//                                             style:  ButtonStyle(
//                                                 backgroundColor: MaterialStateProperty.all(Color(0xFFFF7711)),
//                                                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                                                     RoundedRectangleBorder(
//                                                       borderRadius: BorderRadius.circular(10.0),
//                                                     )
//                                                 )
//                                             ),
//
//                                             child: Container(
//                                               width: 250,
//                                               height: 50,
//                                               alignment: Alignment.center,
//                                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
//                                               child: Text('Awesome'),
//                                             ),
//                                             onPressed: () {
//                                               Navigator.pop(context);
//                                             },
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ));}),
//             ),
//           ),
//         );
//       }
//   );
// }







void showBottomSheetSelector(BuildContext context,select,{ required Function(int, List) onChanged, items}) {
  String searchValue = "";
  var item = items;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {

          search(){
           setState((){
             item = items
                 .where((result) => result.title.toString()
                 .toLowerCase()
                 .contains(searchValue.toLowerCase()))
                 .toList();
           });
          }

          return ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
            ),
            child: AnimatedPadding(
              padding: MediaQuery.of(context).viewInsets,
              duration: const Duration(milliseconds: 100),
              curve: Curves.decelerate,
              child:  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      color: Color.fromRGBO(0, 0, 0, 0.001),
                      child: GestureDetector(
                        onTap: () {},
                        child: DraggableScrollableSheet(
                          initialChildSize: 0.4,
                          minChildSize: 0.2,
                          maxChildSize: 0.75,
                          builder: (_, controller) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(25.0),
                                  topRight: const Radius.circular(25.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 15),
                                      width: 50,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.black26
                                      ),
                                    ),



                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 25.0, top: 15, bottom: 15),
                                        child: Text("Select ${select}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                      ),
                                    ),


                                    Container(
                                      height: 45,
                                      padding: const EdgeInsets.only(bottom: 15),
                                      width: MediaQuery.of(context).size.width*0.9,
                                      child:
                                      TextFormField(
                                        onChanged: (value){
                                          searchValue = value;
                                          search();
                                        },
                                        // controller: fullname,
                                        decoration:
                                        InputDecoration(
                                          prefixIcon: Icon(Icons.search_outlined, size: 30,),
                                          border:
                                          UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors
                                                    .black26,
                                                width: 0.7),
                                          ),
                                          focusedBorder:
                                          UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors
                                                    .black26,
                                                width: 0.7),
                                          ),
                                          enabledBorder:
                                          UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors
                                                    .black26,
                                                width: 0.7),
                                          ),
                                          hintStyle: TextStyle(
                                              color: Colors
                                                  .black45,
                                              fontSize: 13
                                          ),
                                          hintText: "    Search",
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Scrollbar(
                                        child: ListView.builder(
                                          controller: controller,
                                          itemCount: item.length,
                                          itemBuilder: (_, index){
                                            return InkWell(
                                              onTap: (){
                                                onChanged(index, item);
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(15),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("${item[index].title}",
                                                      style: TextStyle(fontWeight: FontWeight.bold),),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 8.0),
                                                      child: Divider(),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

            ),
          );
        }
      );
    },
  );
}



void showBottomSheetCategory(BuildContext context,select,{ required Function(int, List) onChanged, items}) {
  String searchValue = "";
  var item = items;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return StatefulBuilder(
          builder: (context, setState) {
            search(){
              setState((){
                item = items
                    .where((result) => result.title.toString()
                    .toLowerCase()
                    .contains(searchValue.toLowerCase()))
                    .toList();
              });
            }

            return ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25.0),
                topRight: const Radius.circular(25.0),
              ),
              child: AnimatedPadding(
                padding: MediaQuery.of(context).viewInsets,
                duration: const Duration(milliseconds: 100),
                curve: Curves.decelerate,
                child:  GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    color: Color.fromRGBO(0, 0, 0, 0.001),
                    child: GestureDetector(
                      onTap: () {},
                      child: DraggableScrollableSheet(
                        initialChildSize: 0.4,
                        minChildSize: 0.2,
                        maxChildSize: 0.75,
                        builder: (_, controller) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(25.0),
                                topRight: const Radius.circular(25.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 15),
                                    width: 50,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black26
                                    ),
                                  ),



                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 25.0, top: 15, bottom: 15),
                                      child: Text("Select ${select}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                    ),
                                  ),


                                  Container(
                                    height: 45,
                                    padding: const EdgeInsets.only(bottom: 15),
                                    width: MediaQuery.of(context).size.width*0.9,
                                    child:
                                    TextFormField(
                                      onChanged: (value){
                                        searchValue = value;
                                        search();
                                      },
                                      // controller: fullname,
                                      decoration:
                                      InputDecoration(
                                        prefixIcon: Icon(Icons.search_outlined, size: 30,),
                                        border:
                                        UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors
                                                  .black26,
                                              width: 0.7),
                                        ),
                                        focusedBorder:
                                        UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors
                                                  .black26,
                                              width: 0.7),
                                        ),
                                        enabledBorder:
                                        UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors
                                                  .black26,
                                              width: 0.7),
                                        ),
                                        hintStyle: TextStyle(
                                            color: Colors
                                                .black45,
                                            fontSize: 13
                                        ),
                                        hintText: "    Search",
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Scrollbar(
                                      child: ListView.builder(
                                        controller: controller,
                                        itemCount: item.length,
                                        itemBuilder: (_, index){
                                          return InkWell(
                                            onTap: () async {
                                              // onChanged(index, item);
                                              var authProvider = Provider.of<AuthProvider>(context, listen: false);


                                                  if(item[index].selected){
                                                    setState((){
                                                      item[index].selected = !item[index].selected;
                                                    });
                                                    authProvider.removeCategory(item[index]);
                                                  }else{
                                                    if(authProvider.selectedCategory!.length <= 2){
                                                      print(item[index].title);
                                                      print(item[index].title);
                                                    setState((){
                                                      item[index].selected = !item[index].selected;
                                                    });
                                                    authProvider.setCategory(item[index]);
                                                  }else{
                                                      await showTextToast(
                                                        text: "maximum category reached",
                                                        context: context,
                                                      );
                                                    }

                                                  }


                                            },
                                            child: Padding(
                                              padding: EdgeInsets.all(15),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(right:8.0),
                                                        child: Icon(
                                                          item[index].selected?Icons.check_box_outlined:
                                                          Icons.check_box_outline_blank,
                                                          color: Colors.orange,
                                                        ),
                                                      ),
                                                      Text("${item[index].title}",
                                                        style: TextStyle(fontWeight: FontWeight.bold),),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 8.0),
                                                    child: Divider(),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

              ),
            );
          }
      );
    },
  );
}