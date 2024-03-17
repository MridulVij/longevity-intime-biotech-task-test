// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:longevity_intime_biotech_task_test/controllers/constants/colors.dart';

class CustomPersonalChatInfoBox extends StatefulWidget {
  String personMessage;
  String personName;
  int noOfMessages;

  CustomPersonalChatInfoBox({
    Key? key,
    required this.personMessage,
    required this.personName,
    required this.noOfMessages,
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
                  //backgroundImage: ,
                  backgroundColor: CustomColors.chipNotifyColor,
                  radius: 20,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.personName),
                    Text(widget.personMessage),
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
