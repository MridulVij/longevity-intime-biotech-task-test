import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:longevity_intime_biotech_task_test/controllers/utils/utils.dart';
import '../../controllers/constants/colors.dart';
import '../../controllers/constants/icons.dart';
import '../../controllers/services/auth_service.dart';
import '../../controllers/services/chat_service.dart';
import 'custom_personal_chat_info_box.dart';
import '../screens/Task A/chat.dart';
import '../widgets/custom_container_send_receive_box.dart';

class CustomWidgetProvider {
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  Widget allPatientList() {
    return StreamBuilder(
        stream: _chatService.getUserStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Error Loading Users!');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            return ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
    print(patientData['profileImg']);
    return CustomPersonalChatInfoBox(
      gotoScreen: Chat(
          receiverId: patientData['uid'],
          personProfile: '',
          personName: 'Jane Cooper'),
      personLogo: '',
      noOfMessages: 0,
      personMessage: '1h ago, 2 unread message',
      personName: 'Jane Cooper',
    );
  }

  Widget customPatientInfoCallTile(
      String personLogo, personName, Function? onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                child: (personLogo == '')
                    ? SvgPicture.asset(CustomIcons.noProfile)
                    : Image.network(personLogo),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              personName,
              style: const TextStyle(
                color: CustomColors.primaryTextColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: onTap!(),
          icon: SvgPicture.asset(
            CustomIcons.call,
            color: CustomColors.primarySelectedColor,
            height: 30,
          ),
        )
      ],
    );
  }

  Widget patientChatListView(String receiverId, BuildContext context) {
    String senderId = _authService.getCurrentUser()!.uid;
    final Utils utils = Utils();
    return StreamBuilder(
      stream: _chatService.receiveMessage(receiverId, senderId),
      builder: ((context, snapshot) {
        if (!snapshot.hasData) {
          return const Text('No Chats Found!');
        } else if (snapshot.hasError) {
          return const Text('Error, Please Refresh!');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView(
            // controller: utils.scrollController,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: snapshot.data!.docs
                .map((doc) => buildMessageItem(doc))
                .toList(),
          );
        }
      }),
    );
  }

  Widget buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser = data['senderId'] == _authService.getCurrentUser()!.uid;

    bool leftRightAlignment = isCurrentUser ? false : true;
    return Column(
      crossAxisAlignment: leftRightAlignment
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        CustomContainerSendReceiveBox(
          isReceived: leftRightAlignment,
          message: data['message'],
        ),
      ],
    );
  }
}
