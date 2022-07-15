// ignore_for_file: library_private_types_in_public_api

import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CampoDropdown extends StatefulWidget {
  final String label;
  final EdgeInsetsGeometry? inputPadding;
  final EdgeInsetsGeometry? labelPadding;
  final bool obscureText;
  final int maxLines;
  final Color? color;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final List<String> items;

  const CampoDropdown({
    Key? key,
    required this.label,
    this.controller,
    this.obscureText = false,
    this.maxLines = 1,
    this.textInputType = TextInputType.text,
    this.color,
    this.inputPadding,
    this.labelPadding,
    required this.items,
  }) : super(key: key);

  @override
  _CampoDropdownState createState() => _CampoDropdownState();
}

class _CampoDropdownState extends State<CampoDropdown> {
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
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            items: widget.items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: Weight.regular,
                          color: item == widget.controller?.text
                              ? ArielColors.textPrimary
                              : ArielColors.secundary,
                        ),
                      ),
                    ))
                .toList(),
            value: widget.controller?.text,
            onChanged: (value) {
              setState(() {
                widget.controller?.text = value as String;
              });
            },
            buttonPadding: const EdgeInsets.only(left: 8, right: 14),
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: ArielColors.baseDark,
                width: 1.5,
              ),
              color: ArielColors.baseLight,
            ),
            itemPadding: const EdgeInsets.only(left: 8),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: ArielColors.baseLight,
            ),
          ),
        ),
      ]),
    );
  }
}
