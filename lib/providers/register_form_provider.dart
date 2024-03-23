import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';

  validateForm() {
    if (fromKey.currentState!.validate()) {
      print("Form valid ... Login");
    } else {
      print("Form not valid");
    }
  }
}
