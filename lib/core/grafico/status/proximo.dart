import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class StatusProximo extends StatelessWidget {
  final int dias;
  final double fontSize;

  const StatusProximo({Key? key, required this.dias, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Texto(
          dias > 1 ? "FALTAM" : "FALTA",
          fontWeight: Weight.bold,
          padding: const EdgeInsets.all(0),
          size: fontSize * 0.6,
        ),
        Texto(
          "$dias ${dias > 1 ? "DIAS" : "DIA"} ",
          fontWeight: Weight.bold,
          padding: const EdgeInsets.all(0),
          size: fontSize,
        ),
        Texto(
          "PARA A PRÓXIMA\nAPLICAÇÃO",
          textAlign: TextAlign.center,
          fontWeight: Weight.semibold,
          padding: const EdgeInsets.all(0),
          size: fontSize * 0.35,
        ),
      ],
    );
  }
}
