import 'package:flutter/material.dart';

class CustomElevatedButtonStyle {
  static ButtonStyle elevatedButtonBlue() {
    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      shadowColor: Colors.black,
      elevation: 4,
    );
  }
}
