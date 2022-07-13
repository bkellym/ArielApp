import 'package:ariel_app/core/shared/divisoria.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class Subtitulo extends StatelessWidget {
  final Color color;
  final List<String> label;
  final double fontSize;

  const Subtitulo(
    this.label, {
    Key? key,
    this.fontSize = 36,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Texto(
              label[0].toUpperCase(),
              size: SizeConfig.of(context).dynamicScaleSize(size: 18),
              color: color,
              fontWeight: Weight.bold,
            ),
            Texto(
              label[1].toUpperCase(),
              size: SizeConfig.of(context).dynamicScaleSize(size: 18),
              color: color,
              fontWeight: Weight.regular,
            ),
          ],
        ),
        const Divisoria()
      ],
    );
  }
}
