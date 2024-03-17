import 'package:flutter/material.dart';

import '../../../controllers/constants/colors.dart';
import '../../../controllers/constants/icons.dart';
import '../../components/custom_appbar.dart';
import '../../components/custom_filter_chip.dart';
import '../../widgets/custom_message_container.dart';

class Patients extends StatefulWidget {
  const Patients({super.key});

  @override
  State<Patients> createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Set preferred height
        child: CustomAppbar(
          appBarTitle: 'Patient',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomMessageContainer(
                message:
                    'Add, look up, update and run AI models for your patients, which makes easier to track appointments and treatment process',
              ),
              // CustomSearchBox(controller: controller),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Use username or email to start a new chat',
                    style: TextStyle(
                        fontSize: 15, color: CustomColors.primaryTextColor),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Row(
                  children: [
                    CustomFilterChip(
                      chipIcon: CustomIcons.chat,
                      chipName: 'Chats',
                      countOfNotifications: '99+',
                      isSelected: true,
                      onTap: () {},
                    )
                  ],
                ),
                scrollDirection: Axis.horizontal,
              )
            ],
          ),
        ),
      ),
    );
  }
}
