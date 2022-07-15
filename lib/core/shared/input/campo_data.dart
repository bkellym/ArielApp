// ignore_for_file: library_private_types_in_public_api

import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/src/app.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class CampoData extends StatefulWidget {
  final String label;
  final EdgeInsetsGeometry? inputPadding;
  final EdgeInsetsGeometry? labelPadding;
  final TextEditingController? controller;
  final Color? color;
  DateTime selectedDate = DateTime.now();

  CampoData({
    Key? key,
    required this.label,
    this.controller,
    this.color = ArielColors.secundary,
    this.inputPadding,
    this.labelPadding,
  }) : super(key: key);

  @override
  _CampoDataState createState() => _CampoDataState();
}

class _CampoDataState extends State<CampoData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.inputPadding ??
          EdgeInsets.only(
            left: SizeConfig.of(context).dynamicScaleSize(size: 8),
            right: SizeConfig.of(context).dynamicScaleSize(size: 8),
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
          height: 44,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: SizeConfig.of(context).dynamicScaleSize(
                size: 8,
              ),
            ),
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
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                fillColor: ArielColors.baseLight,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: ArielColors.baseDark),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.color ?? ArielColors.secundary)),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
