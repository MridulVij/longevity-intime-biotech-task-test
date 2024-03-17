import 'package:flutter/material.dart';

import '../../../controllers/constants/colors.dart';
import '../../../controllers/constants/icons.dart';
import '../../components/custom_appbar.dart';
import '../../components/custom_filter_chip.dart';
import '../../components/custom_personal_chat_info_box.dart';
import '../../components/custom_searchbox.dart';
import '../../widgets/custom_message_container.dart';

enum Selector {
  archive,
  unread,
  quick,
  newPatient,
  chats,
}

class Patients extends StatefulWidget {
  const Patients({super.key});

  @override
  State<Patients> createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  TextEditingController controller = TextEditingController();
  var buttonSelector = Selector.chats;

  void fetchChipData(Selector value) {
    setState(() {
      buttonSelector = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Set preferred height
        child: CustomAppbar(
          appBarTitle: 'Patient',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Box
              const CustomMessageContainer(
                message:
                    'Add, look up, update and run AI models for your patients, which makes easier to track appointments and treatment process',
              ),
              const SizedBox(
                height: 40,
              ),
              // Custom Search Bar
              CustomSearchBox(controller: controller),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Use username or email to start a new chat',
                    style: TextStyle(
                        fontSize: 15, color: CustomColors.primaryTextColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //Chip Selector
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomFilterChip(
                      chipIcon: CustomIcons.chat,
                      chipName: '  Chats  ',
                      countOfNotifications: '99+',
                      isSelected: buttonSelector == Selector.chats,
                      onTap: () {
                        fetchChipData(Selector.chats);
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomFilterChip(
                      chipIcon: CustomIcons.chat,
                      chipName: '  New Patient  ',
                      countOfNotifications: '',
                      isSelected: buttonSelector == Selector.newPatient,
                      onTap: () {
                        fetchChipData(Selector.newPatient);
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomFilterChip(
                      chipIcon: CustomIcons.chat,
                      chipName: '  Unread  ',
                      countOfNotifications: '',
                      isSelected: buttonSelector == Selector.unread,
                      onTap: () {
                        fetchChipData(Selector.unread);
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomFilterChip(
                      chipIcon: CustomIcons.chat,
                      chipName: '  Archive  ',
                      countOfNotifications: '',
                      isSelected: buttonSelector == Selector.archive,
                      onTap: () {
                        fetchChipData(Selector.archive);
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Recent',
                    style: TextStyle(
                      color: CustomColors.primaryTextColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              CustomPersonalChatInfoBox(
                noOfMessages: 1,
                personMessage: '1h ago, 2 unread message',
                personName: 'Jason LeBron',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
