
import 'dart:convert';
import 'dart:io';


import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:phosphor_flutter/c.dart';
import 'package:provider/provider.dart';
import "package:http/http.dart" as http;

import '../Provider/AuthProvider.dart';
import '../Widget/Circular.dart';

// import '../../../../Provider/Auth.dart';
// import '../../../../Widget/CheckRequestWidget.dart';
// import '../../../SignUp/SignIn.dart';


class EditPrice extends StatefulWidget {


  @override
  State<EditPrice> createState() => EditPriceState();
}

class EditPriceState extends State<EditPrice> {

  String name = "";
  String email = "";

  List<String> ?items = ["Bike", "Car", "Truck"];
  String ?values = "Bike";


  TextEditingController ?maximum;
  TextEditingController ?minimum;
  TextEditingController ?average;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthProvider authProvider =
    Provider.of<AuthProvider>(context, listen: false);
    maximum = TextEditingController(text: (authProvider.maximum ?? 0).toString());
    minimum = TextEditingController(text: (authProvider.minimum ?? 0).toString());
    average = TextEditingController(text: (authProvider.average ?? 0).toString());
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
    Provider.of<AuthProvider>(context, listen: true);


    return Material(
      child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(14),
                topLeft: Radius.circular(14)),
          ),
          height: 240.0,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: ListView(
            children: [
              Text(
                "Edit",
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Maximum Price'),
              Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    border: Border.all(color: Color(0xFFF1F1FD)),
                    borderRadius:
                    BorderRadius.all(Radius.circular(7))),
                child: TextField(
                  // keyboardType: TextInputType.phone,
                  controller: maximum,

                  decoration: InputDecoration.collapsed(
                    hintText: 'Maximum Price',
                    hintStyle: TextStyle(
                        fontSize: 16, color: Colors.black38),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Minimum Price'),
              Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    border: Border.all(color: Color(0xFFF1F1FD)),
                    borderRadius:
                    BorderRadius.all(Radius.circular(7))),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: minimum,

                  decoration: InputDecoration.collapsed(
                    hintText: 'Minimum Price',
                    hintStyle: TextStyle(
                        fontSize: 16, color: Colors.black38),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Average Price'),
              Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    border: Border.all(color: Color(0xFFF1F1FD)),
                    borderRadius:
                    BorderRadius.all(Radius.circular(7))),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: average,

                  decoration: InputDecoration.collapsed(
                    hintText: 'Average Price',
                    hintStyle: TextStyle(
                        fontSize: 16, color: Colors.black38),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Container(
                      height: 34,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xFFE9E9E9), width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: TextButton(
                        // disabledColor: Color(0x909B049B),
                        onPressed: () {
                          circularCustom(context);

                          authProvider.updatePrice(
                            context:  context,
                            min: minimum!.text,
                            max:  maximum!.text,
                            average:  average!.text,
                          ).then((value) {
                            authProvider.getPrice();
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor : Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.all(0.0),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 100, minHeight: 34.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Save",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ])
            ],
          )),
    );
  }






}



