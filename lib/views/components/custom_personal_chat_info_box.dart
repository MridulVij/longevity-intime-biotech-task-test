// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:longevity_intime_biotech_task_test/controllers/constants/colors.dart';
import 'package:longevity_intime_biotech_task_test/controllers/constants/icons.dart';

class CustomPersonalChatInfoBox extends StatefulWidget {
  final String personMessage;
  final String personName;
  final int noOfMessages;
  final String personLogo;
  final Widget gotoScreen;

  const CustomPersonalChatInfoBox({
    Key? key,
    required this.personMessage,
    required this.personName,
    required this.noOfMessages,
    required this.personLogo,
    required this.gotoScreen,
  }) : super(key: key);

  @override
  State<CustomPersonalChatInfoBox> createState() =>
      _CustomPersonalChatInfoBoxState();
}

class _CustomPersonalChatInfoBoxState extends State<CustomPersonalChatInfoBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Ink(
        height: 50,
        // margin: EdgeInsets.symmetric(vertical: 5),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget.gotoScreen),
            );
            print('Tapped!');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(100)),
                    height: 40,
                    width: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: (widget.personLogo == '')
                          ? SvgPicture.asset(CustomIcons.noProfile)
                          : Image.network(widget.personLogo),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.personName,
                        style: const TextStyle(
                          color: CustomColors.primaryTextColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        widget.personMessage,
                        style: const TextStyle(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 2, vertical: 15),
                child: SizedBox(
                  height: 20,
                  child: (widget.noOfMessages > 1)
                      ? Stack(
                          children: [
                            SvgPicture.asset(CustomIcons.multiMsg),
                            Positioned(
                              top: 1,
                              left: 8,
                              right: 0,
                              bottom: 0,
                              child: Text(
                                widget.noOfMessages.toString(),
                                style: const TextStyle(
                                  color: CustomColors.whiteColor,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        )
                      : (widget.noOfMessages == 1)
                          ? SvgPicture.asset(CustomIcons.oneMsg)
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.9),
                              child: SvgPicture.asset(
                                CustomIcons.chat,
                                color: CustomColors.primaryTextColor,
                                height: 20,
                              ),
                            ),
                ),
              ),
              // if no message show normal if 1 message show green if > 1 show no of mgs in it
            ],
          ),
        ),
      ),
    );
  }
}
