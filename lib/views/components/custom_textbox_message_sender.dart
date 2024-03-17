// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextboxMessageSender extends StatelessWidget {
  final TextEditingController? messageController;
  const CustomTextboxMessageSender({
    Key? key,
    this.messageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: messageController,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Send message',
          hintStyle: TextStyle(
            color: Color.fromARGB(92, 94, 169, 250),
          ),
          suffixIcon: Icon(
            Icons.search,
            size: 18,
          ),
        ),
      ),
    );
  }
}
