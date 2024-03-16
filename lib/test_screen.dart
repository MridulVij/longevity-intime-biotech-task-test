import 'package:flutter/material.dart';

import 'views/components/personal_chat_info_box.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PersonalChatInfoBox(
          personName: 'Jason LeBron',
          noOfMessages: 1,
          personMessage: 'hello bro',
        ),
      ),
    );
  }
}
