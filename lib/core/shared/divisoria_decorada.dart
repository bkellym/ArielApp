import 'package:ariel_app/core/util/size_config.dart';
import 'package:flutter/material.dart';

class DivisoriaDecorada extends StatelessWidget {
  final Color cor;
  final EdgeInsetsGeometry? padding;

  const DivisoriaDecorada({
    Key? key,
    required this.cor,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.only(bottom: SizeConfig.of(context).dynamicScaleSize(size: 32)),
      child: Column(children: [
        Stack(alignment: Alignment.centerRight, children: [
          Divider(
            color: cor,
            height: SizeConfig.of(context).dynamicScaleSize(size: 10),
            thickness: SizeConfig.of(context).dynamicScaleSize(size: 1.5),
          ),
          Container(
            width: SizeConfig.of(context).dynamicScaleSize(size: 10),
            height: SizeConfig.of(context).dynamicScaleSize(size: 10),
            margin: EdgeInsets.symmetric(horizontal: SizeConfig.of(context).dynamicScaleSize(size: 24)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: cor,
            ),
          ),
        ]),
      ]),
    );
  }
}
