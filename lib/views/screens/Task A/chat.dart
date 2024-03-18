// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:longevity_intime_biotech_task_test/controllers/services/auth_service.dart';
import 'package:longevity_intime_biotech_task_test/controllers/services/chat_service.dart';
import 'package:longevity_intime_biotech_task_test/controllers/providers/custom_widget_provider.dart';

import '../../components/custom_appbar.dart';
import '../../components/custom_textbox_message_sender.dart';

class Chat extends StatefulWidget {
  final String receiverId;
  Chat({
    super.key,
    required this.receiverId,
  });

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  void initState() {
    super.initState();
    focusNode();
  }

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();
  final TextEditingController _controller = TextEditingController();
  CustomWidgetProvider customWidget = CustomWidgetProvider();
  final ScrollController _scrollController = ScrollController();
  // text field form focus
  FocusNode myFocusNode = FocusNode();

  void focusNode() {
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        Future.delayed(Duration(milliseconds: 500), () => _scrollDown());
      }
    });
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  void sendMessage() async {
    if (_controller.text.isNotEmpty) {
      await _chatService
          .sendMessage(widget.receiverId, _controller.text)
          .then((_) => _controller.clear());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            appBarTitle: 'Chat',
          ),
        ),
        body: Column(
          children: [
            // CustomPatientInfoCallTile(),
            Expanded(
              child: customWidget.patientChatListView(widget.receiverId),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
              child: CustomTextboxMessageSender(
                messageController: _controller,
                sendMsg: sendMessage,
              ),
            ),
          ],
        ));
  }
}
