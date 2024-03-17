// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:longevity_intime_biotech_task_test/controllers/constants/colors.dart';

class CustomContainer extends StatelessWidget {
  final String prefixIcon;
  final double prefixIconSize;
  final String textTitle;
  final bool isCircularShape;
  final bool isPrefixIconNeeded;
  // final Function? onTap;
  const CustomContainer({
    Key? key,
    required this.prefixIcon,
    required this.prefixIconSize,
    required this.textTitle,
    required this.isPrefixIconNeeded,
    required this.isCircularShape,
    // required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // GestureDetector(
        // onTap: onTap!(),
        // child:
        Container(
      decoration: BoxDecoration(
          borderRadius: (isCircularShape)
              ? BorderRadius.circular(100)
              : BorderRadius.circular(10),
          color: CustomColors.primaryBackgroundColor),
      margin: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (isPrefixIconNeeded)
              ? SvgPicture.asset(
                  prefixIcon,
                  height: prefixIconSize,
                )
              : Container(),
          Text('     ' + textTitle + '     '),
        ],
      ),
      // ),
    );
  }
}
