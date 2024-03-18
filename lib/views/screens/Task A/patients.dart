import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../controllers/constants/colors.dart';
import '../../../controllers/constants/icons.dart';
import '../../../controllers/services/auth_service.dart';
import '../../../controllers/services/chat_service.dart';
import '../../components/custom_appbar.dart';
import '../../components/custom_filter_chip.dart';
import '../../components/custom_personal_chat_info_box.dart';
import '../../components/custom_searchbox.dart';
import '../../widgets/custom_message_container.dart';
import '../../widgets/custom_patient_list.dart';
import 'chat.dart';

enum Selector {
  archive,
  unread,
  quick,
  newPatient,
  chats,
}

class Patients extends StatefulWidget {
  const Patients({Key? key}) : super(key: key);

  @override
  State<Patients> createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();
  CustomPatientList customPatientList = CustomPatientList();
  final String containerMessage =
      'Add, look up, update and run AI models for your patients, which makes easier to track appointments and treatment process';

  TextEditingController controller = TextEditingController();
  var buttonSelector = Selector.chats;

  void fetchChipData(Selector value) {
    setState(() {
      buttonSelector = value;
    });
  }

  bool disableTutorialBox = true;
  void dismissTutorialBox() {
    setState(() {
      disableTutorialBox = false;
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Box
              if (disableTutorialBox)
                Column(
                  children: [
                    CustomMessageContainer(
                      onTap: dismissTutorialBox,
                      message: containerMessage,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),

              // Custom Search Bar
              CustomSearchBox(controller: controller),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(CustomIcons.info),
                  const SizedBox(
                    width: 6,
                  ),
                  const Text(
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
                      chipIcon: CustomIcons.archive,
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
                      chipIcon: CustomIcons.unread,
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
                      chipIcon: CustomIcons.archive,
                      chipName: '  Archive  ',
                      countOfNotifications: '',
                      isSelected: buttonSelector == Selector.archive,
                      onTap: () {
                        fetchChipData(Selector.archive);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'All Patients',
                          style: TextStyle(
                            color: CustomColors.primaryTextColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              'Recent first - ',
                              style: TextStyle(
                                color: CustomColors.primaryTextColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                'Tap To Filter',
                                style: TextStyle(
                                  color: CustomColors.primarySelectedColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // Patient List
              // customPatientList.allPatientList(),
              allPatientList()
            ],
          ),
        ),
      ),
    );
  }

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
    return CustomPersonalChatInfoBox(
      gotoScreen: const Chat(),
      personLogo: patientData['profileImg'] ?? CustomIcons.noProfile,
      noOfMessages: 0,
      personMessage: '1h ago, 2 unread message',
      personName: patientData['name'],
    );
  }
}
