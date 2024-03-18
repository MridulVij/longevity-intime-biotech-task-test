import 'package:flutter/material.dart';

import '../../controllers/constants/icons.dart';
import '../../controllers/services/auth_service.dart';
import '../../controllers/services/chat_service.dart';
import '../components/custom_personal_chat_info_box.dart';
import '../screens/Task A/chat.dart';

class CustomPatientList {
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  Widget allPatientList() {
    return StreamBuilder(
        stream: _chatService.getUserStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error Loading Users!');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            return ListView(
              children: snapshot.data!
                  .map<Widget>((patientData) =>
                      _allPatientListItem(patientData, context))
                  .toList(),
            );
          }
        });
  }

  Widget _allPatientListItem(
      Map<String, dynamic> patientData, BuildContext context) {
    return CustomPersonalChatInfoBox(
      gotoScreen: Chat(),
      personLogo: CustomIcons.noProfile,
      noOfMessages: 0,
      personMessage: '1h ago, 2 unread message',
      personName: patientData['email'],
    );
  }
}
