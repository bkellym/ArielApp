import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';

class Titulo extends StatelessWidget {
  final String label;
  final double fontSize;

  const Titulo(
    this.label, {
    Key? key,
    this.fontSize = 36,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.of(context).dynamicScaleSize(size: 110),
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Texto(
          label.toUpperCase(),
          padding: EdgeInsets.only(
            left: SizeConfig.of(context).dynamicScaleSize(
                size: MediaQuery.of(context).size.width * 0.1),
            bottom: SizeConfig.of(context).dynamicScaleSize(size: 8),
          ),
          size: SizeConfig.of(context).dynamicScaleSize(size: fontSize),
          color: Colors.white,
          fontWeight: Weight.bold,
        ),
      ]),
    );
  }
}
