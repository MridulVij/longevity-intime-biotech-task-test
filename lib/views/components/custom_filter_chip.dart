import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../controllers/constants/colors.dart';

class CustomFilterChip extends StatefulWidget {
  final String? countOfNotifications;
  final String? chipName;
  final String? chipIcon;
  final bool? isSelected;
  final Function? onTap;

  CustomFilterChip({
    Key? key,
    required this.countOfNotifications,
    required this.chipName,
    required this.chipIcon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomFilterChip> createState() => _CustomFilterChipState();
}

class _CustomFilterChipState extends State<CustomFilterChip> {
  @override
  Widget build(BuildContext context) {
    Color buttonColor = widget.isSelected!
        ? CustomColors.primarySelectedColor
        : CustomColors.primaryBackgroundColor;
    Color textColor = widget.isSelected!
        ? CustomColors.whiteColor
        : CustomColors.primaryTextColor;
    return GestureDetector(
      onTap: widget.onTap!(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        height: 32,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: buttonColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 5),
            SizedBox(
              width: 16,
              height: 16,
              child: SvgPicture.asset(
                widget.chipIcon!,
                color: textColor,
              ),
            ),
            SizedBox(width: 5),
            Text(
              widget.chipName ?? '',
              style: TextStyle(color: textColor, fontSize: 15),
            ),
            SizedBox(width: 5),
            if (widget.countOfNotifications != '')
              CustomBackgroundTextChip(
                count: widget.countOfNotifications,
              ),
            SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}

class CustomBackgroundTextChip extends StatelessWidget {
  final String? count;
  CustomBackgroundTextChip({
    Key? key,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Color(0xFFF70FFB8)),
      child: Center(
        child: Text(
          count!,
          style: TextStyle(
            height: 1,
          ),
        ),
      ),
    );
  }
}
