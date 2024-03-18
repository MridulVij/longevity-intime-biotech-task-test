import 'package:flutter/material.dart';
import 'package:longevity_intime_biotech_task_test/controllers/constants/colors.dart';
import 'package:longevity_intime_biotech_task_test/controllers/services/auth_service.dart';

class DummyLogin extends StatefulWidget {
  const DummyLogin({super.key});

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
            const Text(
              'This is Dummy Login for Testing Actual Chatting Functionality',
              style: TextStyle(color: CustomColors.primaryTextColor),
            ),
            const Text('Doctor Login:-'),
            const Text('Test Email - testuser1@gmail.com'),
            const Text('Test Password - 123456'),
            const SizedBox(
              height: 20,
            ),
            const Text('Patient Login:-'),
            const Text('Test Email - testuser2@gmail.com'),
            const Text('Test Password - 123456'),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Enter Test Email'),
            ),
            TextFormField(
              controller: passwordController,
              decoration:
                  const InputDecoration(hintText: 'Enter Test Password'),
            ),
            if (isButtonClick) const CircularProgressIndicator(),
            ElevatedButton(
              onPressed: () {
                buttonClick();
                authService.signInWithEmailPass(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: const Text('Sign In'),
            ),
            const Text(
              'Why Login?\nBecause App is Connected with Firebase Backend and we have to test Doctor to Patient Chats Thats Why We Require 2 Id\'s to Test This Functionality!',
              style: TextStyle(color: CustomColors.primarySelectedColor),
            ),
            const Text(
                'I have used Doctor App\'s Chat UI as a Patient App Chat UI'),
          ],
        ),
      ),
    );
  }
}
