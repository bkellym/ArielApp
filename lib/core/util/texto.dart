import 'package:flutter/material.dart';

import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/colors.dart';

class Texto extends StatelessWidget {
  String data;
  double size;
  FontWeight fontWeight;
  Color color;
  EdgeInsetsGeometry? padding;

  Texto(
    this.data, {
    Key? key,
    required this.size,
    this.fontWeight = Weight.regular,
    this.color = ArielColors.textPrimary,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Text(
        data,
        style: TextStyle(
          height: 0,
          letterSpacing: 0,
          fontWeight: fontWeight,
          decoration: TextDecoration.none,
          color: color,
          fontSize: SizeConfig.of(context).dynamicScaleSize(size: size),
        ),
      ),
    );
  }
}

class Weight {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semibold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extrabold = FontWeight.w800;
}
