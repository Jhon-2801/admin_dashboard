import 'package:flutter/material.dart';


class CustomInput{

  static InputDecoration authbuildInputDecoration(
    {required String label, required IconData icon}) 
  {
    return InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
        labelText: label,
        prefixIcon: Icon(icon));
  }
}