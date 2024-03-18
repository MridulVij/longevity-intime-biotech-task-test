// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:longevity_intime_biotech_task_test/controllers/services/auth_service.dart';
import 'package:longevity_intime_biotech_task_test/controllers/services/chat_service.dart';
import 'package:longevity_intime_biotech_task_test/controllers/providers/custom_widget_provider.dart';

import '../../components/custom_appbar.dart';
import '../../components/custom_textbox_message_sender.dart';

class Chat extends StatelessWidget {
  final String receiverId;
  Chat({
    super.key,
    required this.receiverId,
  });

  final ChatService _chatService = ChatService();

  final AuthService _authService = AuthService();

  final TextEditingController _controller = TextEditingController();

  CustomWidgetProvider customWidget = CustomWidgetProvider();

  void sendMessage() async {
    if (_controller.text.isNotEmpty) {
      await _chatService.sendMessage(receiverId, _controller.text);
      _controller.clear();
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
        // CustomPatientInfoCallTile()
        body: Column(
          children: [
            Expanded(
              child: customWidget.patientChatListView(receiverId),
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
