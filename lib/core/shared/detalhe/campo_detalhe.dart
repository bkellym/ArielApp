import 'package:ariel_app/core/shared/divisoria.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class CampoDetalhe extends StatelessWidget {
  final String titulo;
  final String valor;
  final Color color;
  final Color lineColor;
  final EdgeInsetsGeometry? padding;

  const CampoDetalhe({
    Key? key,
    required this.titulo,
    required this.valor,
    required this.color,
    required this.lineColor,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Texto(
            titulo.toUpperCase(),
            size: SizeConfig.of(context).dynamicScaleSize(size: 10),
            color: color,
            fontWeight: Weight.bold,
            padding: const EdgeInsets.only(bottom: 5),
          ),
          Row(children: [
            const VerticalDivider(width: 2),
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
          ]),
          const Divisoria()
        ]));
  }
}
