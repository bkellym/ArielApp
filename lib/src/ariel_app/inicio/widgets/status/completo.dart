import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class StatusCompleto extends StatelessWidget {
  const StatusCompleto({Key? key, required}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Texto(
          "CICLO",
          fontWeight: Weight.bold,
          padding: const EdgeInsets.all(0),
          size: SizeConfig.of(context).dynamicScaleSize(size: 9),
        ),
        Texto(
          "COMPLETO",
          fontWeight: Weight.bold,
          padding: const EdgeInsets.all(0),
          size: SizeConfig.of(context).dynamicScaleSize(size: 15),
        ),
      ],
    );
  }
}
