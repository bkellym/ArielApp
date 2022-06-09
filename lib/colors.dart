import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArielColors {
  static ButtonStyle buttontheme = ElevatedButton.styleFrom(
    primary: Colors.transparent,
    onPrimary: Colors.white,
    onSurface: Colors.transparent,
    shadowColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
  );

  // Cores utilizadas para gradiente (fundo, botões, etc...) / "cor" primária
  static const Color gradientLight = Color(0xFF1CE8B4);
  static const Color gradientDark = Color(0xFF1CC2EB);

  // Cores bases
  static const Color textPrimary = Color(0xFF666666);
  static const Color secundary = Color(0xFF905CED);
  static const Color baseDark = Color(0xFFCCCCCC);
  static const Color baseLight = Color(0xFFFFFFFF);

  // Cores externas
  static const Color googleRed = Color(0xFFDD4B39);
  static const Color facebookBlue = Color(0xFF3B5998);

  static const Color transparent = Colors.transparent;
}
