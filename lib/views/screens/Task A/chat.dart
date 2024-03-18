// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:longevity_intime_biotech_task_test/controllers/constants/colors.dart';
import 'package:longevity_intime_biotech_task_test/controllers/constants/icons.dart';
import 'package:longevity_intime_biotech_task_test/views/components/custom_searchbox.dart';

import '../../components/custom_appbar.dart';
import '../../components/custom_filter_chip.dart';
import '../../widgets/custom_container_send_receive_box.dart';
import '../../widgets/custom_message_container.dart';

class Chat extends StatelessWidget {
  const Chat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            appBarTitle: 'Chat',
          ),
        ),
        body: Container());
  }
}
