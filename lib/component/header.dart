import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../config/responsive.dart';
import '../style/colors.dart';
import '../style/style.dart';


class Header extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
      SizedBox(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                  text: 'Dashboard',
                  size: 30,
                  fontWeight: FontWeight.w800),
              PrimaryText(
                text: 'dash admin',
                size: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.secondary,
              )
            ]),
      ),
      Spacer(
        flex: 1,
      ),
      Expanded(
        flex: Responsive.isDesktop(context) ? 1 : 3,
        child: SvgPicture.asset("assets/home.svg",
            width: 35),
      ),
    ]);
  }
}
