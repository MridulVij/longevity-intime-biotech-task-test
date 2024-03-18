// import 'package:flutter/material.dart';

// import '../../../controllers/constants/icons.dart';
// import '../../../controllers/services/chat_service.dart';
// import '../../components/custom_personal_chat_info_box.dart';
// import 'chat.dart';

// class TestListView extends StatefulWidget {
//   const TestListView({super.key});

//   @override
//   State<TestListView> createState() => _TestListViewState();
// }

// class _TestListViewState extends State<TestListView> {
//   // Instance
//   final ChatService _chatService = ChatService();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(child: allPatientList()),
//     );
//   }

//   Widget allPatientList() {
//     return StreamBuilder(
//         stream: _chatService.getUserStream(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Text('Error Loading Users!');
//           } else if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else {
//             return ListView(
//               children: snapshot.data!
//                   .map<Widget>((patientData) =>
//                       _allPatientListItem(patientData, context))
//                   .toList(),
//             );
//           }
//         });
//   }

//   Widget _allPatientListItem(
//       Map<String, dynamic> patientData, BuildContext context) {
//     return CustomPersonalChatInfoBox(
//       gotoScreen: Chat(),
//       personLogo: CustomIcons.noProfile,
//       noOfMessages: 0,
//       personMessage: '1h ago, 2 unread message',
//       personName: patientData['name'],
//     );
//   }
// }
