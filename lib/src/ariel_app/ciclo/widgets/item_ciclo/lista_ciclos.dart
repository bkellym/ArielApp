import 'package:ariel_app/core/models/ciclo_model.dart';
import 'package:ariel_app/core/shared/divisoria_decorada.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/src/ariel_app/ciclo/widgets/item_ciclo/ciclo_widget.dart';
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
        DivisoriaDecorada(
          titulo: titulo,
          cor: ArielColors.cicloColor,
          padding: const EdgeInsets.only(top: 16),
        ),
        Column(
          children: lista.map((ciclo) => CicloWidget(model: ciclo)).toList(),
        )
      ],
    );
  }
}
