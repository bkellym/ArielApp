import 'package:ariel_app/colors.dart';
import 'package:flutter/material.dart';

class Texto {
  static Widget extraBold({
    required String data,
    required double size,
    Color color = ArielColors.textPrimary,
  }) {
    return Text(
      data,
      style: TextStyle(
        fontWeight: FontWeight.w800,
        decoration: TextDecoration.none,
        color: color,
        fontSize: size,
      ),
    );
  }

  static Widget bold({
    required String data,
    required double size,
    Color color = ArielColors.textPrimary,
  }) {
    return Text(
      data,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none,
        color: color,
        fontSize: size,
      ),
    );
  }

  static Widget semiBold({
    required String data,
    required double size,
    Color color = ArielColors.textPrimary,
  }) {
    return Text(
      data,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none,
        color: color,
        fontSize: size,
      ),
    );
  }

  static Widget regular({
    required String data,
    required double size,
    Color color = ArielColors.textPrimary,
  }) {
    return Text(
      data,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none,
        color: color,
        fontSize: size,
      ),
    );
  }
}
