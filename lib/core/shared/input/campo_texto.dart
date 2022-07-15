// ignore_for_file: library_private_types_in_public_api

import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  final String label;
  final EdgeInsetsGeometry? inputPadding;
  final EdgeInsetsGeometry? labelPadding;
  final bool obscureText;
  final int maxLines;
  final Color? color;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  const CampoTexto({
    Key? key,
    required this.label,
    this.controller,
    this.obscureText = false,
    this.maxLines = 1,
    this.textInputType = TextInputType.text,
    this.color,
    this.inputPadding,
    this.labelPadding,
  }) : super(key: key);

  @override
  _CampoextoState createState() => _CampoextoState();
}

class _CampoextoState extends State<CampoTexto> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.inputPadding ??
          EdgeInsets.only(
            bottom: SizeConfig.of(context).dynamicScaleSize(size: 16),
          ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Texto(
          widget.label,
          color: widget.color ?? ArielColors.secundary,
          fontWeight: Weight.semibold,
          size: SizeConfig.of(context).dynamicScaleSize(size: 9),
          padding: widget.labelPadding ??
              EdgeInsets.only(
                bottom: SizeConfig.of(context).dynamicScaleSize(
                  size: 4,
                ),
              ),
        ),
        TextFormField(
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
            contentPadding: EdgeInsets.all(
                SizeConfig.of(context).dynamicScaleSize(size: 10)),
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
      ]),
    );
  }
}
