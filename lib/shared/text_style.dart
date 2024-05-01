import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle textStyleBlue(double size) {
    return TextStyle(
      color: const Color(0xFF184C81),
      fontSize: size,
      fontFamily: 'Plus Jakarta Sans',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textStyleWhite(double size) {
    return TextStyle(
      color: Colors.white,
      fontSize: size,
      fontFamily: 'Plus Jakarta Sans',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textStyleBlack(double size) {
    return TextStyle(
      color: Colors.black,
      fontSize: size,
      fontFamily: 'Plus Jakarta Sans',
      fontWeight: FontWeight.w600,
    );
  }
}
