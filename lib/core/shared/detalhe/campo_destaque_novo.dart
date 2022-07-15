import 'package:ariel_app/core/shared/divisoria.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class CampoDestaque extends StatelessWidget {
  final String titulo;
  final Color color;
  final IconData icon;
  final EdgeInsetsGeometry? padding;

  const CampoDestaque({
    Key? key,
    required this.titulo,
    required this.color,
    required this.icon,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.of(context).dynamicScaleSize(size: 16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Texto(
            titulo,
            size: SizeConfig.of(context).dynamicScaleSize(size: 12),
            fontWeight: Weight.bold,
            padding: EdgeInsets.only(
                left: SizeConfig.of(context).dynamicScaleSize(size: 8)),
          )
        ],
      ),
    );
  }
}
