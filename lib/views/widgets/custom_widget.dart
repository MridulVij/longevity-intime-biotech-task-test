import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../controllers/constants/colors.dart';
import '../../controllers/constants/icons.dart';
import '../../controllers/services/auth_service.dart';
import '../../controllers/services/chat_service.dart';
import '../components/custom_personal_chat_info_box.dart';
import '../screens/Task A/chat.dart';
import 'custom_container_send_receive_box.dart';

class CustomWidget {
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
    // if (patientData['email'] != _authService.getCurrentUser()!.email)
    print(patientData['profileImg']);
    return CustomPersonalChatInfoBox(
      gotoScreen: Chat(
        receiverId: patientData['uid'],
      ),
      personLogo: '',
      noOfMessages: 0,
      personMessage: '1h ago, 2 unread message',
      personName: 'Jane Cooper',
    );
  }

  Widget customPatientInfoCallTile(
    String personLogo,
    personName,
  ) {
    return Row(
      children: [
        //Image
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: (personLogo == '')
                ? SvgPicture.asset(CustomIcons.noProfile)
                : Image.network(personLogo),
          ),
        ),
        //Text
        Text(
          personName,
          style: const TextStyle(
            color: CustomColors.primaryTextColor,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        //iconbutton
        IconButton(
          onPressed: () {
            print('call tapped');
          },
          icon: SvgPicture.asset(
            CustomIcons.call,
            color: CustomColors.primarySelectedColor,
            height: 30,
          ),
        )
      ],
    );
  }

  Widget patientChatListView(String receiverId) {
    String senderId = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.receiveMessage(receiverId, senderId),
      builder: ((context, snapshot) {
        if (!snapshot.hasData) {
          return Text('No Chats Found!');
        } else if (snapshot.hasError) {
          return Text('Error, Please Refresh!');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView(
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
    // If this is Current user send the message in left with blue
    bool isCurrentUser = data['senderId'] == _authService.getCurrentUser()!.uid;

    // if this User is receiver then message in right with green
    bool leftRightAlignment = isCurrentUser ? false : true;
    return CustomContainerSendReceiveBox(
      isReceived: leftRightAlignment,
      message: data['message'],
    );
  }

  // Widget _buildMessage(String message, bool isReceiver) {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(vertical: 10.0),
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
  //       child: Column(
  //         crossAxisAlignment:
  //             isReceiver ? CrossAxisAlignment.end : CrossAxisAlignment.start,
  //         children: <Widget>[
  //           Text(
  //             isReceiver ? 'You' : 'Buddy',
  //             style: const TextStyle(fontWeight: FontWeight.bold),
  //           ),
  //           Container(
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(10),
  //                 color: Colors.deepPurple[50]),
  //             child: Padding(
  //               padding: const EdgeInsets.all(6.0),
  //               child: SelectableText(
  //                 message.text,
  //                 onTap: () {},
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
