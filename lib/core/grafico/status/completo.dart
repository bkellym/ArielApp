import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class StatusCompleto extends StatelessWidget {
  final double fontSize;

  const StatusCompleto({Key? key, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Texto(
          "CICLO",
          fontWeight: Weight.bold,
          padding: const EdgeInsets.all(0),
          size: fontSize * 0.6,
        ),
        Texto(
          "COMPLETO",
          fontWeight: Weight.bold,
          padding: const EdgeInsets.all(0),
          size: fontSize,
        ),
      ],
    );
  }
}
