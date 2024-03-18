import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:longevity_intime_biotech_task_test/views/screens/Task%20A/dummy_login.dart';
import 'package:longevity_intime_biotech_task_test/views/screens/Task%20A/patients.dart';

import '../../views/screens/Task A/dashboard.dart';

class AuthGateService extends StatelessWidget {
  const AuthGateService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Dashboard();
            } else {
              return DummyLogin();
            }
          }),
    );
  }
}
