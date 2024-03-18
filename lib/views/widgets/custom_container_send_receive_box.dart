import 'package:flutter/material.dart';
import 'package:longevity_intime_biotech_task_test/controllers/constants/colors.dart';

class CustomContainerSendReceiveBox extends StatelessWidget {
  final String? message;
  final bool isReceived;
  const CustomContainerSendReceiveBox({
    Key? key,
    required this.message,
    required this.isReceived,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: (isReceived)
              ? const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.zero,
                  topRight: Radius.circular(10))
              : const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.zero,
                ),
          color: (isReceived)
              ? CustomColors.primaryBackgroundColor
              : const Color.fromARGB(49, 34, 219, 108)),
      child: Center(
        child: Expanded(
          child: Text(
            message!,
            style: const TextStyle(
                color: CustomColors.primaryTextColor, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
