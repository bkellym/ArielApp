import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class StatusAtrasado extends StatelessWidget {
  final double fontSize;

  const StatusAtrasado({Key? key, required, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Texto(
          "APLICAÇÃO",
          fontWeight: Weight.bold,
          color: ArielColors.arielRed,
          padding: const EdgeInsets.all(0),
          size: fontSize * 0.6,
        ),
        Texto(
          "ATRASADA",
          fontWeight: Weight.bold,
          color: ArielColors.arielRed,
          padding: const EdgeInsets.all(0),
          size: fontSize,
        ),
      ],
    );
  }
}
