// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:longevity_intime_biotech_task_test/controllers/constants/colors.dart';

class CustomChipIconButton extends StatelessWidget {
  final String? icon;
  final String? text;
  const CustomChipIconButton({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: CustomColors.primaryBackgroundColor),
      child: Row(
        children: [
          Container(
            child: SvgPicture.asset(icon!),
          ),
          Text(
            text!,
            style:
                TextStyle(fontSize: 15, color: CustomColors.primaryTextColor),
          ),
        ],
      ),
    );
  }
}
