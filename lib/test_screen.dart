import 'package:flutter/material.dart';

import 'controllers/constants/icons.dart';
import 'views/components/custom_filter_chip.dart';
import 'views/components/custom_personal_chat_info_box.dart';
import 'views/components/custom_searchbox.dart';
import 'views/screens/Task A/chat.dart';
import 'views/screens/Task A/patients.dart';
import 'views/widgets/custom_container.dart';
import 'views/widgets/custom_message_container.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

enum Selector {
  archive,
  unread,
  quick,
  newPatient,
  chats,
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    //
    var buttonSelector = Selector.chats;
    TextEditingController controller = TextEditingController();
    //
    return Patients();
  }
}
   /* Scaffold(
      body: SafeArea(
        child: Chat,
        // child: CustomMessageContainer(
        //     message:
        //         'Add Look sdfjsfh  hsdfh hf d hfuihs  uih hsdf  usd hfhs f  hs fui ffhusd f d fussdfsd'),
        // child: Row(
        //   children: [
        //     CustomFilterChip(
        //       isSelected: buttonSelector == Selector.chats,
        //       onTap: () {
        //         // setState(() {
        //         buttonSelector = Selector.chats;
        //         // });
        //       },
        //       countOfNotifications: '99+',
        //       chipIcon: CustomIcons.chat,
        //       chipName: 'Chats',
        //     ),
        //     CustomFilterChip(
        //       isSelected: buttonSelector == Selector.archive,
        //       onTap: () {
        //         // setState(() {
        //         buttonSelector = Selector.archive;
        //         // });
        //       },
        //       countOfNotifications: '',
        //       chipIcon: CustomIcons.chat,
        //       chipName: 'Chats',
        //     ),
        //   ],
        // ),
        //     child: CustomSearchBox(
        //   controller: controller,
        // )
        /* Row(
          children: [
            
            //
            // CustomContainer(
            //   isCircularShape: false,
            //   isPrefixIconNeeded: true,
            //   prefixIconSize: 20,
            //   prefixIcon: CustomIcons.chat,
            //   textTitle: 'Button',
            // ),
            // CustomContainer(
            //   isCircularShape: true,
            //   isPrefixIconNeeded: true,
            //   prefixIconSize: 20,
            //   prefixIcon: CustomIcons.chat,
            //   textTitle: 'Button',
            // ),
          ],
        ),*/

        //
        // child: CustomFilterChip(
        //   isSelected: buttonSelector == Selector.chats,
        //   onTap: () {
        //     setState(() {
        //       buttonSelector = Selector.chats;
        //     });
        //   },
        //   countOfNotifications: '99',
        //   chipIcon: CustomIcons.chat,
        //   chipName: 'Chats',
        // ),
        //
        // child: CustomPersonalChatInfoBox(
        //   personName: 'Jason LeBron',
        //   noOfMessages: 1,
        //   personMessage: 'hello bro',
        // ),
      ),
    );
  }
}
*/


/*
enum AutoGFX {
  twelve,
  eleven,
  ten,
  nine,
  eight,
  seven,
  six,
  five,
  four,
  three,
  two,
  one
}

  var autogfx = AutoGFX.one;

   isSelected: autogfx == AutoGFX.one,
                              onPress: () {
                                setState(() {
                                  autogfx = AutoGFX.one;
                                });

*/