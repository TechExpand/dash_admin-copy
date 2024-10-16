import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

extension StringExtension on String {
  String capitalized() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}


String mapKey = 'AIzaSyDqS-Lfk163FJbQMGcGFrUUaT4JgF_mkAE';





class RequestHelper {

  Future<File> fileFromImageUrl(String url) async {
    final response = await http.get(Uri.parse(url));

        final documentDirectory = await getApplicationDocumentsDirectory();

    final file = File(join(documentDirectory.path, 'imagetest.png'));

    file.writeAsBytesSync(response.bodyBytes);

    return file;
  }


  static Future<dynamic> getRequest(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        String data = response.body;

        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        return 'failed';
      }
    } catch (e) {
      //  return 'failed';
      print(e);
      print('REQUEST HELPER WAHALAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
    }
  }


  void showInSuccessSnackBar(BuildContext context, String value) {
    var snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Success!!',
        message: '$value',
        contentType: ContentType.success,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
    //   dismissDirection: DismissDirection.horizontal,
    //   content: TweenAnimationBuilder(
    //     tween: Tween<double>(begin: 1, end: 0),
    //     duration: Duration(seconds: 1),
    //     curve: Curves.easeIn,
    //     builder: (BuildContext context, double? _val, Widget? child) {
    //       return Transform.translate(
    //           offset: Offset(
    //             _val! * 140,
    //             0.0,
    //           ),
    //           child: child);
    //     },
    //     child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             'Message',
    //             style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.white,
    //
    //           ),
    //           SizedBox(
    //             height: 5,
    //           ),
    //           Text(
    //             value,
    //             style: TextStyle(
    //                 color: Colors.white,
    //                 fontWeight: FontWeight.w400,
    //
    //           ),
    //         ]),
    //   ),
    //   backgroundColor: Color.fromRGBO(37, 211, 102, .4),
    //   behavior: SnackBarBehavior.floating,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    //   margin: EdgeInsets.only(
    //       //bottom: MediaQuery.of(context).size.height - 130,
    //       bottom: MediaQuery.of(context).size.height / 1.22,
    //       right: 20,
    //       left: 20,
    //       top: 50),
    // ));
  }




  void showInErrorSnackBar2(BuildContext context, String value) {
    value = value
        .replaceAll('{', '')
        .replaceAll('}', '')
        .replaceAll('[', '')
        .replaceAll(']', '');
    var snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Oh Snap!',
        message: '$value',
        contentType: ContentType.failure,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }



  void showInErrorSnackBar(BuildContext context, String value) {
    var snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Oh Snap!',
        message:
        '${value.toString().replaceAll('{', '').replaceAll('}', '').replaceAll('[', '').replaceAll(']', '')}',
        contentType: ContentType.failure,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //navigatorKey.currentContext!
    // ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
    //   dismissDirection: DismissDirection.horizontal,
    //   content: TweenAnimationBuilder(
    //     tween: Tween<double>(begin: 1, end: 0),
    //     duration: Duration(seconds: 1),
    //     curve: Curves.easeIn,
    //     builder: (BuildContext context, double? _val, Widget? child) {
    //       return Transform.translate(
    //           offset: Offset(
    //             _val! * 140,
    //             0.0,
    //           ),
    //           child: child);
    //       //return Padding(padding: EdgeInsets.all(_val), child: child);
    //     },
    //     child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             'Error',
    //             style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.black,
    //
    //           ),
    //           SizedBox(
    //             height: 5,
    //           ),
    //           Text(
    //             value[0],
    //             style: TextStyle(
    //                 color: Colors.black45,
    //                 fontWeight: FontWeight.w400,
    //
    //           ),
    //         ]),
    //   ),
    //   backgroundColor: Color.fromRGBO(255, 127, 127, .7),
    //   behavior: SnackBarBehavior.floating,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    //   margin: EdgeInsets.only(
    //       //bottom: MediaQuery.of(context).size.height - 130,
    //       bottom: MediaQuery.of(context).size.height / 1.22,
    //       right: 20,
    //       left: 20,
    //       top: 40),
    // ));
  }



  void showDowntimeErrorSnackBar(BuildContext context, String value) {
    value = value
        .replaceAll('{', '')
        .replaceAll('}', '')
        .replaceAll('[', '')
        .replaceAll(']', '');
    var snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Downtime!',
        message: '$value',
        contentType: ContentType.failure,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}



