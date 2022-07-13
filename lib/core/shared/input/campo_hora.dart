// ignore_for_file: library_private_types_in_public_api

import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/src/app.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class CampoHora extends StatefulWidget {
  final EdgeInsetsGeometry padding;
  final Color? color;
  final double? height;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;

  const CampoHora({
    Key? key,
    required this.padding,
    this.onSaved,
    this.color,
    this.controller,
    this.height,
  }) : super(key: key);

  @override
  _CampoHoraState createState() => _CampoHoraState();
}

class _CampoHoraState extends State<CampoHora> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Container(
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
    );
  }
}
