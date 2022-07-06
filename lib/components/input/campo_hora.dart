// ignore_for_file: library_private_types_in_public_api

import 'package:ariel_app/src/app.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class CampoData extends StatefulWidget {
  final EdgeInsetsGeometry padding;
  final void Function(String?)? onSaved;

  const CampoData({
    Key? key,
    required this.padding,
    this.onSaved,
  }) : super(key: key);

  @override
  _CampoDataState createState() => _CampoDataState();
}

class _CampoDataState extends State<CampoData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: DateTimePicker(
        type: DateTimePickerType.time,
        locale: myLocale,
        dateMask: "Hm",
        initialValue: DateTime.now().toString(),
        firstDate: DateTime(1900),
        lastDate: DateTime(5000),
        style: const TextStyle(
          color: ArielColors.textPrimary,
          fontWeight: FontWeight.normal,
          fontSize: 12,
          decoration: TextDecoration.none,
        ),
        decoration: const InputDecoration(
          suffixIcon: Icon(
            Icons.keyboard_arrow_down,
            color: ArielColors.secundary,
          ),
          isDense: true,
          contentPadding: EdgeInsets.all(10),
          fillColor: ArielColors.baseLight,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ArielColors.baseDark),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ArielColors.secundary)),
        ),
        onSaved: widget.onSaved,
      ),
    );
  }
}
