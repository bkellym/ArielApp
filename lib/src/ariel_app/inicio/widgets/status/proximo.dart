import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class StatusProximo extends StatelessWidget {
  final int dias;

  const StatusProximo({Key? key, required this.dias}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Texto(
          dias > 1 ? "FALTAM" : "FALTA",
          fontWeight: Weight.bold,
          padding: const EdgeInsets.all(0),
          size: SizeConfig.of(context).dynamicScaleSize(size: 12),
        ),
        Texto(
          "$dias ${dias > 1 ? "DIAS" : "DIA"} ",
          fontWeight: Weight.bold,
          padding: const EdgeInsets.all(0),
          size: SizeConfig.of(context).dynamicScaleSize(size: 20),
        ),
        Texto(
          "PARA A PRÓXIMA\nAPLICAÇÃO",
          textAlign: TextAlign.center,
          fontWeight: Weight.semibold,
          padding: const EdgeInsets.all(0),
          size: SizeConfig.of(context).dynamicScaleSize(size: 6),
        ),
      ],
    );
  }
}
