import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class StatusHoje extends StatelessWidget {
  const StatusHoje({Key? key, required}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Texto(
          "HOJE É DIA DE",
          fontWeight: Weight.bold,
          color: ArielColors.cicloColor,
          padding: const EdgeInsets.all(0),
          size: SizeConfig.of(context).dynamicScaleSize(size: 9),
        ),
        Texto(
          "APLICAÇÃO",
          fontWeight: Weight.bold,
          color: ArielColors.cicloColor,
          padding: const EdgeInsets.all(0),
          size: SizeConfig.of(context).dynamicScaleSize(size: 15),
        ),
      ],
    );
  }
}
