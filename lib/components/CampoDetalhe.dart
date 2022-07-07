import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class CampoDetalhe extends StatelessWidget {
  final String titulo;
  final String valor;
  final double leftPadding;
  final Color color;
  final Color lineColor;

  const CampoDetalhe({
    Key? key,
    required this.titulo,
    required this.valor,
    required this.leftPadding,
    required this.color,
    required this.lineColor,
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
          ),
        ),
        Row(
          children: [
            VerticalDivider(
              width: leftPadding,
            ),
            SizedBox(
                height: SizeConfig.of(context).dynamicScaleSize(size: 30),
                child: VerticalDivider(
                    color: lineColor,
                    width: SizeConfig.of(context).dynamicScaleSize(size: 0),
                    thickness: 1)),
            Texto(
              valor.toLowerCase(),
              size: SizeConfig.of(context).dynamicScaleSize(size: 11),
              fontWeight: Weight.regular,
              padding: EdgeInsets.only(
                left: SizeConfig.of(context).dynamicScaleSize(size: (8)),
              ),
            ),
          ],
        ),
        const Divider(
          height: 16,
          color: Color(0x00FFFFFF),
        )
      ],
    );
  }
}
