import 'package:flutter/material.dart';
import 'package:longevity_intime_biotech_task_test/controllers/constants/colors.dart';
import 'package:longevity_intime_biotech_task_test/controllers/services/auth_service.dart';

class DummyLogin extends StatefulWidget {
  DummyLogin({super.key});

  @override
  State<DummyLogin> createState() => _DummyLoginState();
}

class _DummyLoginState extends State<DummyLogin> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isButtonClick = false;

  void buttonClick() {
    setState(() {
      isButtonClick = !isButtonClick;
    });
  }

  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is Dummy Login for Testing Actual Chatting Functionality',
              style: TextStyle(color: CustomColors.primaryTextColor),
            ),
            Text('Test Email - testuser@gmail.com'),
            Text('Test Password - testuser@123'),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Enter Test Email'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(hintText: 'Enter Test Password'),
            ),
            if (isButtonClick) CircularProgressIndicator(),
            ElevatedButton(
              onPressed: () {
                buttonClick();
                authService.signInWithEmailPass(
                    emailController.text, passwordController.text);
              },
              child: Text('Sign In'),
            ),
            Text(
              'Why Login? Because App is Connected with Firebase Backend and we have to test Doctor to Patient Chat Thats Why We Require 2 Id\'s to Test This Functanility!',
              style: TextStyle(color: CustomColors.primarySelectedColor),
            ),
          ],
        ),
      ),
    );
  }
}
