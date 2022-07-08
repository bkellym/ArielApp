import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class StatusAtrasado extends StatelessWidget {
  const StatusAtrasado({Key? key, required}) : super(key: key);

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
          size: SizeConfig.of(context).dynamicScaleSize(size: 9),
        ),
        Texto(
          "ATRASADA",
          fontWeight: Weight.bold,
          color: ArielColors.arielRed,
          padding: const EdgeInsets.all(0),
          size: SizeConfig.of(context).dynamicScaleSize(size: 15),
        ),
      ],
    );
  }
}
