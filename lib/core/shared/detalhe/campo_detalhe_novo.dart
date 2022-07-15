import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class CampoDetalhe extends StatelessWidget {
  final String titulo;
  final String valor;
  final Color color;
  final EdgeInsetsGeometry? padding;

  const CampoDetalhe({
    Key? key,
    required this.titulo,
    required this.valor,
    required this.color,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsets.symmetric(
              horizontal: SizeConfig.of(context).dynamicScaleSize(size: 36),
              vertical: SizeConfig.of(context).dynamicScaleSize(size: 8)),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Texto(
                    titulo.toUpperCase(),
                    fontWeight: Weight.bold,
                    color: color,
                    size: SizeConfig.of(context).dynamicScaleSize(size: 10),
                    padding: EdgeInsets.only(
                        right:
                            SizeConfig.of(context).dynamicScaleSize(size: 8)),
                  )
                ],
              )),
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  Texto(
                    valor,
                    size: SizeConfig.of(context).dynamicScaleSize(size: 10),
                    fontWeight: Weight.regular,
                    padding: EdgeInsets.only(
                        left: SizeConfig.of(context).dynamicScaleSize(size: 8)),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
