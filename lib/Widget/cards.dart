






import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget  verifyCard(context, {color, date, status}){
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 140,
                      child: Image.asset("image/bgline.png", fit: BoxFit.cover,)),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Verification status", style: TextStyle(fontSize: 15, color: Color(0xFFFFC0AD)),),
                        Text(status, style: TextStyle(fontSize: 25, fontWeight:FontWeight.bold,color: Colors.white),),
                        Text("${formatYear3(DateTime.parse(date))}", style: TextStyle(color: Color(0xFFD1D5DB)),)
                      ],
                    ),
                  )
                ],
              ),
              height: 140,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Align(
                alignment: Alignment.topRight,
                child: Image.asset("image/bronze.png")),
          ],
        ),
      );
}



formatYear3(DateTime now) {
  final DateFormat formatter = DateFormat('MMMM. dd yyyy');
  final String formatted =
  formatter.format(now == null ? DateTime.now() : now);
  return formatted;
}