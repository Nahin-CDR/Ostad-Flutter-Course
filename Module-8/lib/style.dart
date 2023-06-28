import 'package:flutter/material.dart';

class Style {
  static InputDecoration appInputDecoration({required String label}) {
    return InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
        border: const OutlineInputBorder(),
        labelText: label);
  }

  static ButtonStyle appButtonStyle() {
    return ElevatedButton.styleFrom(

        padding: const EdgeInsets.all(2),
        backgroundColor: Colors.blue
    );
  }
  static TextStyle normalTextStyle(){
    return const TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontSize: 16
    );
  }
}
