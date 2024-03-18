// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:longevity_intime_biotech_task_test/controllers/services/auth_service.dart';
import 'package:longevity_intime_biotech_task_test/controllers/services/chat_service.dart';
import 'package:longevity_intime_biotech_task_test/controllers/utils/utils.dart';
import 'package:longevity_intime_biotech_task_test/views/components/custom_widget_provider.dart';

import '../../components/custom_appbar.dart';
import '../../components/custom_textbox_message_sender.dart';

class Chat extends StatefulWidget {
  final String personProfile;
  final String personName;
  final String receiverId;
  Chat({
    Key? key,
    required this.personProfile,
    required this.personName,
    required this.receiverId,
  }) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final CustomWidgetProvider customWidgetProvider = CustomWidgetProvider();
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();
  final TextEditingController _controller = TextEditingController();
  final Utils utils = Utils();
  CustomWidgetProvider customWidget = CustomWidgetProvider();

  void sendMessage() async {
    if (_controller.text.isNotEmpty) {
      await _chatService
          .sendMessage(widget.receiverId, _controller.text)
          .then((_) => _controller.clear());
    }
  }

  @override
  void initState() {
    super.initState();
    utils.focusNode();
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
            customWidgetProvider.customPatientInfoCallTile(
                widget.personProfile, widget.personName),
            Expanded(
              child: customWidget.patientChatListView(widget.receiverId),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
              child: CustomTextboxMessageSender(
                focusNode: utils.myFocusNode,
                messageController: _controller,
                sendMsg: sendMessage,
              ),
            ),
          ],
        ));
  }
}
