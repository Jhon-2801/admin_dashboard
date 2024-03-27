import 'package:flutter/material.dart';

class NotificationService {
  static GlobalKey<ScaffoldMessengerState> messagerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbarError(String message) {
    final snackBar = SnackBar(
        content: Text(
      message,
      style: const TextStyle(fontSize: 20, color: Colors.red),
    ));
    messagerKey.currentState!.showSnackBar(snackBar);
  }

  static showSnackbar(String message) {
    final snackBar = SnackBar(
        content: Text(
      message,
      style: const TextStyle(fontSize: 20, color: Colors.white),
    ));
    messagerKey.currentState!.showSnackBar(snackBar);
  }
}
