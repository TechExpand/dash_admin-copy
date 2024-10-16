import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


bool shouldPop = true;
circularCustom(context)async{
  return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return WillPopScope (
          onWillPop: () async {
            return shouldPop;
          },
          child: Dialog(
            elevation: 0,
            child:  CupertinoActivityIndicator(
              radius: 30,
            ),
            backgroundColor: Colors.transparent,
          ),
        );
      });
}