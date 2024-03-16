// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PersonalChatInfoBox extends StatefulWidget {
  String personMessage;
  String personName;
  int noOfMessages;

  PersonalChatInfoBox({
    Key? key,
    required this.personMessage,
    required this.personName,
    required this.noOfMessages,
  }) : super(key: key);

  @override
  State<PersonalChatInfoBox> createState() => _PersonalChatInfoBoxState();
}

class _PersonalChatInfoBoxState extends State<PersonalChatInfoBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CircleAvatar(
                  //backgroundImage: ,
                  radius: 25,
                ),
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
    );
  }
}
