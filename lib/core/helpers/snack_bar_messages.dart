import 'package:flutter/material.dart';

class SnackBarMessages {
  void showSuccessSnackBar({
    required BuildContext context,
    required String message,
    Color? color,
    int secondsDuration = 2,
    SnackBarBehavior? behavior,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: color ?? Colors.green,
        duration: Duration(seconds: secondsDuration),
        behavior: behavior ?? SnackBarBehavior.fixed,
      ),
    );
  }

  void showErrorSnackBar({
    required String message,
    Color? color,
    required BuildContext context,
    int secondsDuration = 2,
    SnackBarBehavior? behavior,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor: color ?? Colors.redAccent,
      duration: Duration(seconds: secondsDuration),
      behavior: behavior ?? SnackBarBehavior.fixed,
    ));
  }
}
