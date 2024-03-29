import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:longevity_intime_biotech_task_test/controllers/constants/colors.dart';
import 'package:longevity_intime_biotech_task_test/controllers/constants/icons.dart';

class CustomTextboxMessageSender extends StatelessWidget {
  final TextEditingController? messageController;
  final VoidCallback sendMsg;
  final FocusNode? focusNode;
  const CustomTextboxMessageSender({
    Key? key,
    required this.messageController,
    required this.sendMsg,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: 310,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: CustomColors.primaryBackgroundColor),
          child: TextFormField(
            // focusNode: focusNode,
            controller: messageController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Send message',
              hintStyle: TextStyle(
                color: Color.fromARGB(92, 94, 169, 250),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: sendMsg,
          icon: SvgPicture.asset(
            CustomIcons.sendMsg,
            color: CustomColors.primarySelectedColor,
            height: 30,
          ),
        )
      ],
    );
  }
}
