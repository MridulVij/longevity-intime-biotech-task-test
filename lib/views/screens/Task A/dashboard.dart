import 'package:flutter/material.dart';
import 'package:longevity_intime_biotech_task_test/views/screens/Task%20A/patients.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Patients()),
            );
          },
          child: Text('Open Patient List'),
        ),
      ),
    );
  }
}
