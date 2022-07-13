import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class CampoDestaque extends StatelessWidget {
  final String titulo;
  final String valor;
  final double leftPadding;
  final Color color;

  const CampoDestaque({
    Key? key,
    required this.titulo,
    required this.valor,
    required this.leftPadding,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Texto(
          titulo.toUpperCase(),
          size: SizeConfig.of(context).dynamicScaleSize(size: 10),
          color: color,
          fontWeight: Weight.bold,
          padding: EdgeInsets.only(
              left: SizeConfig.of(context).dynamicScaleSize(size: leftPadding),
              bottom: SizeConfig.of(context).dynamicScaleSize(size: 6)),
        ),
        Texto(
          valor,
          size: SizeConfig.of(context).dynamicScaleSize(size: 11),
          fontWeight: Weight.bold,
          padding: EdgeInsets.only(
            left: SizeConfig.of(context).dynamicScaleSize(size: leftPadding),
            bottom: SizeConfig.of(context).dynamicScaleSize(size: 12),
          ),
        ),
      ],
    );
  }
}
