import 'package:ariel_app/components/divisoria_decorada.dart';
import 'package:ariel_app/core/models/ciclo_model.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/screens/ciclo/widgets/item_ciclo/ciclo_widget.dart';
import 'package:flutter/material.dart';

class ListaCiclos extends StatelessWidget {
  final String titulo;
  final List<CicloModel> lista;

  const ListaCiclos({
    Key? key,
    required this.titulo,
    required this.lista,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Texto(
          titulo.toUpperCase(),
          size: SizeConfig.of(context).dynamicScaleSize(size: 11),
          color: ArielColors.cicloColor,
          fontWeight: Weight.bold,
          padding: EdgeInsets.only(
              top: SizeConfig.of(context).dynamicScaleSize(size: 24),
              left: SizeConfig.of(context).dynamicScaleSize(size: 24)),
        ),
        const DivisoriaDecorada(cor: ArielColors.cicloColor),
        Column(
          children: lista.map((ciclo) => CicloWidget(model: ciclo)).toList(),
        )
      ],
    );
  }
}
