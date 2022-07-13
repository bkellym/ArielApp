import 'package:ariel_app/core/shared/divisoria.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class CampoDestaque extends StatelessWidget {
  final String titulo;
  final String valor;
  final Color color;
  final EdgeInsetsGeometry? padding;
  final bool asIcon;

  const CampoDestaque({
    Key? key,
    required this.titulo,
    required this.valor,
    required this.color,
    this.asIcon = false,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Texto(
            titulo.toUpperCase(),
            size: SizeConfig.of(context).dynamicScaleSize(size: 10),
            color: color,
            fontWeight: Weight.bold,
            padding: EdgeInsets.only(
              bottom: SizeConfig.of(context).dynamicScaleSize(size: 6),
              left: asIcon
                  ? SizeConfig.of(context).dynamicScaleSize(size: 16)
                  : 0,
            ),
          ),
          Row(children: [
            asIcon
                ? Icon(
                    Icons.circle,
                    size: SizeConfig.of(context).dynamicScaleSize(size: 9),
                    color: color,
                  )
                : const SizedBox.shrink(),
            Texto(
              valor,
              size: SizeConfig.of(context).dynamicScaleSize(size: 11),
              fontWeight: Weight.bold,
              padding: EdgeInsets.only(
                left: asIcon
                    ? SizeConfig.of(context).dynamicScaleSize(size: 8)
                    : 0,
              ),
            ),
          ]),
          const Divisoria()
        ],
      ),
    );
  }
}
