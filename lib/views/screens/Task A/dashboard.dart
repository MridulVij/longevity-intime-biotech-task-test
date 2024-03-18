import 'package:flutter/material.dart';
import 'package:longevity_intime_biotech_task_test/controllers/services/auth_service.dart';
import 'package:longevity_intime_biotech_task_test/views/screens/Task%20A/patients.dart';

import 'dummy_login.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Patients()),
                );
              },
              child: Text('Open Patient List'),
            ),
            ElevatedButton(
                onPressed: () async {
                  await authService.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DummyLogin(),
                    ),
                  );
                },
                child: Text('Sign Out'))
          ],
        ),
      ),
    );
  }
}
