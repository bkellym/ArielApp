// ignore_for_file: library_private_types_in_public_api

import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/app.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class CampoData extends StatefulWidget {
  final EdgeInsetsGeometry padding;
  final TextEditingController controller;
  DateTime selectedDate = DateTime.now();

  CampoData({
    Key? key,
    required this.padding,
    required this.controller,
  }) : super(key: key);

  @override
  _CampoDataState createState() => _CampoDataState();
}

class _CampoDataState extends State<CampoData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      child: Padding(
        padding: widget.padding,
        child: DateTimePicker(
          locale: myLocale,
          dateMask: "d 'de' MMMM 'de' yyyy",
          controller: widget.controller,
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
              Icons.calendar_month,
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
        ),
      ),
    );
  }
}