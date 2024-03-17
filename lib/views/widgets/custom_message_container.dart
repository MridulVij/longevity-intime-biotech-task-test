// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../controllers/constants/colors.dart';

class CustomMessageContainer extends StatelessWidget {
  final String? message;
  const CustomMessageContainer({
    Key? key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColors.primaryBackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(
                message!,
                style: const TextStyle(
                    color: CustomColors.primaryTextColor, fontSize: 20),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Dismiss',
                      style: TextStyle(
                        color: CustomColors.primarySelectedColor,
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
