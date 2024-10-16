
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:martline_admin/dashboard.dart';
import 'package:provider/provider.dart';
import '../../Model/service.dart';
import 'Auth/getstarted.dart';
import 'Auth/loginAccount.dart';
import 'Provider/AuthProvider.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SPLASHSTATE();
  }
}

class SPLASHSTATE extends State<SplashScreen> {




  @override
  void initState() {
    super.initState();
    // Provider.of<LocationService>(context, listen: false).getCurrentLocation();
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.getPrice();







    Future<Future> decideFirstWidget() async {
      GetStorage box = GetStorage();
      var userId =   box.read("userId");
      print(userId);
      print(userId);
      print(userId);

      if (userId == null || userId == 'null' || userId == '') {
        return Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return  getStarted();

            },
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
              (route) => false,
        );
      }else{
        return Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return Dashboard(); //SignUpAddress();
            },
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
              (route) => false,
        );
      }
    }


    Future.delayed(Duration(seconds: 5), () async {
      decideFirstWidget();
    });

    // getState();
    //Instabug.start(INSTABUG_TOKEN, [InvocationEvent.shake]);
  }



  bool  willpop = false;

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: ()async{
        return willpop;
      },
      child: Material(
        child: Container(
          color: Color(0xFFFFFFFF),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Hero(
              tag: 'MainImage',
              child: Image.asset(
                'image/dash.png',
                // scale: 6.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
