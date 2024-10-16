import 'package:flutter/material.dart';
import 'package:martline_admin/AdminCreate/AssignMartket.dart';
import 'package:martline_admin/Pages/updatePrice.dart';
import 'package:martline_admin/style/colors.dart';
import 'package:martline_admin/style/style.dart';
import 'AdminCreate/AssignSubCat.dart';
import 'AdminEdit/Ads.dart';
import 'AdminEdit/Markets.dart';
import 'Pages/Verification.dart';
import 'Pages/AllDelivery.dart';
import 'Pages/AllEarnings.dart';
import 'Pages/AllUsers.dart';
import 'component/appBarActionItems.dart';
import 'component/barChart.dart';
import 'component/header.dart';
import 'component/historyTable.dart';
import 'component/infoCard.dart';
import 'component/paymentDetailList.dart';
import 'component/sideMenu.dart';
import 'config/responsive.dart';
import 'config/size_config.dart';

class Dashboard extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // key: _drawerKey,
      // drawer: SizedBox(width: 100, child: SideMenu()),
      // appBar: !Responsive.isDesktop(context)
      //     ? AppBar(
      //         elevation: 0,
      //         backgroundColor: AppColors.white,
              // leading: IconButton(
              //     onPressed: () {
              //       // MerchantVerification();
              //       _drawerKey.currentState!.openDrawer();
              //     },
              //     icon: Icon(Icons.menu, color: AppColors.black)),
              // actions: [
              //   AppBarActionItems(),
              // ],
          //   )
          // : PreferredSize(
          //     preferredSize: Size.zero,
          //     child: SizedBox(),
          //   ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // if (Responsive.isDesktop(context))
            //   Expanded(
            //     flex: 1,
            //     child: SideMenu(),
            //   ),
            Expanded(
                flex: 10,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Header(),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth,
                          child: Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              InfoCard(
                                  icon: 'assets/transfer.svg',
                                  label: 'Deliveries\n',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                              secondaryAnimation) {
                                            return AllDelivery(); //SignUpAddress();
                                          },
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            return FadeTransition(
                                              opacity: animation,
                                              child: child,
                                            );
                                          },
                                        ));
                                  },
                                  amount: ''),
                             
                             
                              InfoCard(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                              secondaryAnimation) {
                                            return MerchantVerification(); //SignUpAddress();
                                          },
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            return FadeTransition(
                                              opacity: animation,
                                              child: child,
                                            );
                                          },
                                        ));
                                  },
                                  icon: 'assets/transfer.svg',
                                  label: 'Verification\n',
                                  amount: '\$150'),
                              InfoCard(
                                  icon: 'assets/bank.svg',
                                  label: 'Earnings',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                              secondaryAnimation) {
                                            return AllEarning(); //SignUpAddress();
                                          },
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            return FadeTransition(
                                              opacity: animation,
                                              child: child,
                                            );
                                          },
                                        ));
                                  },
                                  amount: ''),
                              InfoCard(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                              secondaryAnimation) {
                                            return AllUsers(); //SignUpAddress();
                                          },
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            return FadeTransition(
                                              opacity: animation,
                                              child: child,
                                            );
                                          },
                                        ));
                                  },
                                  icon: 'assets/invoice.svg',
                                  label: 'Users',
                                  amount: '\$1500'),



                                       InfoCard(
                                  icon: 'assets/transfer.svg',
                                  label: 'Price\n',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                              secondaryAnimation) {
                                            return EditPrice(); //SignUpAddress();
                                          },
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            return FadeTransition(
                                              opacity: animation,
                                              child: child,
                                            );
                                          },
                                        ));
                                  },
                                  amount: ''),
                             
                             
                              // InfoCard(
                              //     icon: 'assets/credit-card.svg',
                              //     label: 'Transafer via \nCard number',
                              //     amount: '\$1200'),
                              // InfoCard(
                              //     icon: 'assets/transfer.svg',
                              //     label: 'Verification',
                              //     onTap: (){
                              //
                              //       Navigator.push(
                              //           context,
                              //           PageRouteBuilder(
                              //             pageBuilder: (context, animation,
                              //                 secondaryAnimation) {
                              //               return MerchantVerification(); //SignUpAddress();
                              //             },
                              //             transitionsBuilder: (context,
                              //                 animation,
                              //                 secondaryAnimation,
                              //                 child) {
                              //               return FadeTransition(
                              //                 opacity: animation,
                              //                 child: child,
                              //               );
                              //             },
                              //           ));
                              //     },
                              //     amount: '\$150'),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: SizeConfig.blockSizeVertical! * 4,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         PrimaryText(
                        //           text: 'Balance',
                        //           size: 16,
                        //           fontWeight: FontWeight.w400,
                        //           color: AppColors.secondary,
                        //         ),
                        //         PrimaryText(
                        //             text: '\$1500',
                        //             size: 30,
                        //             fontWeight: FontWeight.w800),
                        //       ],
                        //     ),
                        //     PrimaryText(
                        //       text: 'Past 30 DAYS',
                        //       size: 16,
                        //       fontWeight: FontWeight.w400,
                        //       color: AppColors.secondary,
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: SizeConfig.blockSizeVertical! * 3,
                        // ),
                        // Container(
                        //   height: 180,
                        //   child: BarChartCopmponent(),
                        // ),
                        // SizedBox(
                        //   height: SizeConfig.blockSizeVertical! * 5,
                        // ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     PrimaryText(
                        //         text: 'History',
                        //         size: 30,
                        //         fontWeight: FontWeight.w800),
                        //     PrimaryText(
                        //       text: 'Transaction of lat 6 month',
                        //       size: 16,
                        //       fontWeight: FontWeight.w400,
                        //       color: AppColors.secondary,
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: SizeConfig.blockSizeVertical! * 3,
                        // ),
                        // HistoryTable(),
                        // if (!Responsive.isDesktop(context)) PaymentDetailList()
                      ],
                    ),
                  ),
                )),
            // if (Responsive.isDesktop(context))
            //   Expanded(
            //     flex: 4,
            //     child: SafeArea(
            //       child: Container(
            //         width: double.infinity,
            //         height: SizeConfig.screenHeight,
            //         decoration: BoxDecoration(color: AppColors.secondaryBg),
            //         child: SingleChildScrollView(
            //           padding:
            //               EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            //           child: Column(
            //             children: [
            //               AppBarActionItems(),
            //               PaymentDetailList(),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
