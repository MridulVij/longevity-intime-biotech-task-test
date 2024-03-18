// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../controllers/constants/colors.dart';

class CustomAppbar extends StatelessWidget {
  final String? appBarTitle;
  const CustomAppbar({
    super.key,
    this.appBarTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        appBarTitle!,
        style: const TextStyle(
          color: CustomColors.primaryTextColor,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: CustomColors.primaryTextColor,
          )),
    );
  }
}
