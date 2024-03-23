import 'package:flutter/material.dart';

class LoginFromProvider extends ChangeNotifier {
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  bool validateForm() {
    return fromKey.currentState!.validate();
  }
}
