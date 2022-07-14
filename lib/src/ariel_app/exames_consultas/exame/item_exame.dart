import 'package:ariel_app/core/models/exame_model.dart';
import 'package:ariel_app/core/shared/detalhe/campo_destaque.dart';
import 'package:ariel_app/core/shared/detalhe/campo_detalhe.dart';
import 'package:ariel_app/core/util/colors.dart';
import 'package:ariel_app/core/util/size_config.dart';
import 'package:ariel_app/core/util/texto.dart';
import 'package:ariel_app/src/ariel_app/exames_consultas/exame/detalhe/detalhe_widget.dart';
import 'package:ariel_app/src/ariel_app/exames_consultas/exame/inserirResultados/inserir_resultado_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemExameWidget extends StatefulWidget {
  final ExameModel model;

  const ItemExameWidget({Key? key, required this.model}) : super(key: key);

  @override
  State<ItemExameWidget> createState() => _ItemExameWidgetState();
}

class _ItemExameWidgetState extends State<ItemExameWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double leftPadding =
        SizeConfig.of(context).dynamicScaleSize(size: 32);

    return Container(
      padding: EdgeInsets.only(
          top: SizeConfig.of(context).dynamicScaleSize(size: 8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const VerticalDivider(width: 16),
              CampoDestaque(
                titulo: "TIPO",
                valor: widget.model.tipo,
                color: ArielColors.exameColor,
                asIcon: true,
              ),
              CampoDetalhe(
                titulo: "DATA",
                valor: DateFormat("dd/MM/yyyy").format(widget.model.dataHora),
                color: ArielColors.exameColor,
                lineColor: ArielColors.exameColor,
                padding: EdgeInsets.only(
                  top: SizeConfig.of(context).dynamicScaleSize(size: 0),
                  left: leftPadding,
                ),
              ),
              CampoDetalhe(
                titulo: "HORÁRIO",
                valor: DateFormat("dd/MM/yyyy").format(widget.model.dataHora),
                color: ArielColors.exameColor,
                lineColor: ArielColors.exameColor,
                padding: EdgeInsets.only(
                  top: SizeConfig.of(context).dynamicScaleSize(size: 0),
                  left: leftPadding,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.of(context).dynamicScaleSize(size: 32)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            SizeConfig.of(context).dynamicScaleSize(size: 24)),
                    primary: ArielColors.exameColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InserirResultadoWidget(
                                model: widget.model,
                              )),
                    );
                  },
                  child: Texto(
                    "inserir resultados".toUpperCase(),
                    size: SizeConfig.of(context).dynamicScaleSize(size: 11),
                    color: Colors.white,
                    fontWeight: Weight.bold,
                    padding: const EdgeInsets.all(0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: SizeConfig.of(context).dynamicScaleSize(size: 32)),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size(100, 36),
                    primary: ArielColors.exameColor,
                    side: const BorderSide(
                      color: ArielColors.exameColor,
                      width: 1.5,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetalheExameWidget(
                                model: widget.model,
                              )),
                    );
                  },
                  child: Texto(
                    "detalhes".toUpperCase(),
                    size: SizeConfig.of(context).dynamicScaleSize(size: 11),
                    color: ArielColors.exameColor,
                    fontWeight: Weight.bold,
                    padding: const EdgeInsets.all(0),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
