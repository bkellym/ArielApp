// ignore_for_file: library_private_types_in_public_api

import 'package:ariel_app/core/util/colors.dart';
import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  final String label;
  final double leftPadding;
  final double rightPadding;
  final double bottomPadding;
  final bool obscureText;
  final TextEditingController? controller;

  const CampoTexto({
    Key? key,
    required this.label,
    required this.controller,
    this.leftPadding = 8,
    this.rightPadding = 8,
    this.obscureText = false,
    this.bottomPadding = 16,
  }) : super(key: key);

  @override
  _CampoextoState createState() => _CampoextoState();
}

class _CampoextoState extends State<CampoTexto> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: widget.leftPadding,
        right: widget.rightPadding,
        bottom: widget.bottomPadding,
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        style: const TextStyle(
          color: ArielColors.textPrimary,
          fontWeight: FontWeight.normal,
          fontSize: 12,
          decoration: TextDecoration.none,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.all(10),
          hintText: widget.label,
          hintStyle: const TextStyle(
            color: ArielColors.baseDark,
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.none,
          ),
          fillColor: ArielColors.baseLight,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: ArielColors.baseDark),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ArielColors.secundary)),
        ),
      ),
    );
  }
}
