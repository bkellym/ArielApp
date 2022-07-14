import 'package:ariel_app/core/models/consulta_model.dart';
import 'package:ariel_app/core/models/exame_model.dart';
import 'package:ariel_app/core/shared/divisoria_decorada.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListaItens extends StatelessWidget {
  final String titulo;
  final List<Map<String, dynamic>> lista;
  final bool ativo;
  final Color color;

  const ListaItens({
    Key? key,
    required this.titulo,
    required this.lista,
    this.ativo = false,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return lista.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DivisoriaDecorada(
                titulo: titulo,
                cor: color,
                padding: const EdgeInsets.only(bottom: 8, top: 8),
              ),
              Column(
                  children: lista
                      .map((mapa) => _ItemWidget(
                            ativo: ativo,
                            model: mapa['model'],
                            titulo: mapa['titulo'],
                            data: mapa['dataHora'],
                            color: ativo ? mapa['color'] : ArielColors.textPrimary,
                            background: ativo ? mapa['background'] : ArielColors.disable,
                          ))
                      .toList())
            ],
          )
        : const SizedBox.shrink();
  }
}

class _ItemWidget extends StatelessWidget {
  final Object model;
  final String titulo;
  final bool ativo;
  final Color color;
  final Color background;
  final DateTime data;

  const _ItemWidget({
    Key? key,
    required this.model,
    required this.titulo,
    required this.ativo,
    required this.color,
    required this.background,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.of(context).dynamicScaleSize(size: 8)),
      child: Container(
        color: background,
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.of(context).dynamicScaleSize(size: 16),
            horizontal: SizeConfig.of(context).dynamicScaleSize(size: 16)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Row(children: [
                Icon(
                  Icons.bookmark_border,
                  color: color,
                ),
                Texto(
                  titulo,
                  fontWeight: Weight.bold,
                  size: SizeConfig.of(context).dynamicScaleSize(size: 12),
                  padding: const EdgeInsets.only(left: 8),
                ),
              ]),
            ),
            Expanded(
              flex: 2,
              child: Row(children: [
                Texto(
                  "DATA",
                  color: color,
                  fontWeight: Weight.bold,
                  size: SizeConfig.of(context).dynamicScaleSize(size: 10),
                ),
                Texto(
                  DateFormat("dd/MM/yyyy").format(data),
                  fontWeight: Weight.regular,
                  size: SizeConfig.of(context).dynamicScaleSize(size: 10),
                  padding: const EdgeInsets.only(left: 8),
                ),
              ]),
            ),
            Expanded(
              flex: 2,
              child: Row(children: [
                Texto(
                  "HORA",
                  color: color,
                  fontWeight: Weight.bold,
                  size: SizeConfig.of(context).dynamicScaleSize(size: 10),
                ),
                Texto(
                  DateFormat("Hm").format(data),
                  fontWeight: Weight.regular,
                  size: SizeConfig.of(context).dynamicScaleSize(size: 10),
                  padding: const EdgeInsets.only(left: 8),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
