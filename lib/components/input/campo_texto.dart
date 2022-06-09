// ignore_for_file: library_private_types_in_public_api

import 'package:ariel_app/colors.dart';
import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  final String label;
  final double leftPadding;
  final double rightPadding;
  final double bottomPadding;

  const CampoTexto({
    Key? key,
    required this.label,
    this.leftPadding = 8,
    this.rightPadding = 8,
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
        style: const TextStyle(
          color: ArielColors.textPrimary,
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.all(10),
          hintText: widget.label,
          hintStyle: const TextStyle(
              color: ArielColors.baseDark,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.normal),
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
