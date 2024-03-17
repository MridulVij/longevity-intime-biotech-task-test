// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'package:longevity_intime_biotech_task_test/controllers/constants/colors.dart';

class CustomPersonalChatInfoBox extends StatefulWidget {
  final String personMessage;
  final String personName;
  final int noOfMessages;
  final String personLogo;

  CustomPersonalChatInfoBox({
    Key? key,
    required this.personMessage,
    required this.personName,
    required this.noOfMessages,
    required this.personLogo,
  }) : super(key: key);

  @override
  State<CustomPersonalChatInfoBox> createState() =>
      _CustomPersonalChatInfoBoxState();
}

class _CustomPersonalChatInfoBoxState extends State<CustomPersonalChatInfoBox> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      // margin: EdgeInsets.symmetric(vertical: 10),
      height: 50,
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: ClipRRect(
                    // borderRadius: BorderRadius.circular(50),
                    child: SvgPicture.asset(
                      widget.personLogo,
                      // height: 1,
                      // width: 30,
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 40,
                //   width: 40,
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(100),
                //     child: SvgPicture.asset(
                //       widget.personLogo,
                //       // height: 30,
                //       // width: 30,
                //     ),
                //   ),
                // ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.personName,
                      style: TextStyle(
                        color: CustomColors.primaryTextColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      widget.personMessage,
                      style: TextStyle(
                        color: CustomColors.primaryTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                height: 10,
                width: 10,
                color: Colors.red,
              ),
            ),
            // if no message show normal if 1 message show green if > 1 show no of mgs in it
          ],
        ),
      ),
    );
  }
}
