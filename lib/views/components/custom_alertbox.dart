import 'package:flutter/material.dart';

class CustomAlertBox {
  static showAlert(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            //
          },
        ),
      ),
    );
  }
}
