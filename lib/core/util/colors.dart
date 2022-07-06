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

  static const Color disabledGradientLight = Color(0xFFC7C7C7);
  static const Color disabledGradientDark = Color(0xFFA5A5A5);

  // Cores bases
  static const Color cicloColor = Color(0xFF1DD7D0);
  static const Color textPrimary = Color(0xFF666666);
  static const Color textLight= Color(0xFF999999);
  static const Color secundary = Color(0xFF905CED);
  static const Color baseDark = Color(0xFFCCCCCC);
  static const Color baseLight = Color(0xFFFFFFFF);
  static const Color disable = Color(0xFFE6E6E6);
  static const Color arielRed = Color(0xFFFF6D7C);
  static const Color arielGreen = Color(0xFF1CDBC6);

  // Cores externas
  static const Color googleRed = Color(0xFFDD4B39);
  static const Color facebookBlue = Color(0xFF3B5998);

  static const Color transparent = Colors.transparent;
}
