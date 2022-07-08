// ignore_for_file: library_private_types_in_public_api

import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  final String? label;
  final double leftPadding;
  final double rightPadding;
  final double bottomPadding;
  final bool obscureText;
  final int maxLines;
  final Color? color;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  const CampoTexto({
    Key? key,
    this.label,
    this.leftPadding = 8,
    this.rightPadding = 8,
    this.controller,
    this.obscureText = false,
    this.bottomPadding = 16,
    this.maxLines = 1,
    this.textInputType = TextInputType.text,
    this.color,
  }) : super(key: key);

  @override
  _CampoextoState createState() => _CampoextoState();
}

class _CampoextoState extends State<CampoTexto> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.of(context).dynamicScaleSize(size: widget.leftPadding),
        right:
            SizeConfig.of(context).dynamicScaleSize(size: widget.rightPadding),
        bottom:
            SizeConfig.of(context).dynamicScaleSize(size: widget.bottomPadding),
      ),
      child: TextFormField(
        keyboardType: widget.textInputType,
        maxLines: widget.maxLines,
        controller: widget.controller,
        obscureText: widget.obscureText,
        style: TextStyle(
          color: ArielColors.textPrimary,
          fontWeight: FontWeight.normal,
          fontSize: SizeConfig.of(context).dynamicScaleSize(size: 12),
          decoration: TextDecoration.none,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding:
              EdgeInsets.all(SizeConfig.of(context).dynamicScaleSize(size: 10)),
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
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: widget.color ?? ArielColors.secundary)),
        ),
      ),
    );
  }
}
