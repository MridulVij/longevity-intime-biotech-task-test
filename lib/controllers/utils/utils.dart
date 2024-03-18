import 'package:flutter/material.dart';

class Utils {
  //
  final ScrollController scrollController = ScrollController();
  final FocusNode myFocusNode = FocusNode();

  void focusNode() {
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        Future.delayed(Duration(milliseconds: 500), () => _scrollDown());
      }
    });
  }

  void _scrollDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  //
}
