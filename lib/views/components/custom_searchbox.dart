import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:longevity_intime_biotech_task_test/controllers/constants/colors.dart';
import 'package:longevity_intime_biotech_task_test/controllers/constants/icons.dart';

class CustomSearchBox extends StatefulWidget {
  final TextEditingController controller;

  const CustomSearchBox({Key? key, required this.controller}) : super(key: key);

  @override
  _CustomSearchBoxState createState() => _CustomSearchBoxState();
}

class _CustomSearchBoxState extends State<CustomSearchBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColors.primaryBackgroundColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Username, Name, Date...',
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
