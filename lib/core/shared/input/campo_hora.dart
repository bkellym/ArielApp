// ignore_for_file: library_private_types_in_public_api

import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/src/app.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class CampoHora extends StatefulWidget {
  final Color? color;
  final String label;
  final double? height;
  final void Function(String?)? onSaved;
  final EdgeInsetsGeometry? inputPadding;
  final EdgeInsetsGeometry? labelPadding;

  final TextEditingController? controller;

  const CampoHora(this.label, {
    Key? key,
    this.onSaved,
    this.color,
    this.controller,
    this.height,
    this.inputPadding,
    this.labelPadding,
  }) : super(key: key);

  @override
  _CampoHoraState createState() => _CampoHoraState();
}

class _CampoHoraState extends State<CampoHora> {
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
        Container(
          height: widget.height ?? 36,
          padding: const EdgeInsets.all(0),
          child: DateTimePicker(
            type: DateTimePickerType.time,
            locale: myLocale,
            dateMask: "Hm",
            controller: widget.controller,
            firstDate: DateTime(1900),
            lastDate: DateTime(5000),
            style: const TextStyle(
              color: ArielColors.textPrimary,
              fontWeight: FontWeight.normal,
              fontSize: 12,
              decoration: TextDecoration.none,
            ),
            decoration: InputDecoration(
              isDense: false,
              contentPadding: const EdgeInsets.all(10),
              fillColor: ArielColors.transparent,
              border: const OutlineInputBorder(borderSide: BorderSide()),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: widget.color ?? ArielColors.secundary)),
            ),
            onSaved: widget.onSaved,
          ),
        ),
      ]),
    );
  }
}
